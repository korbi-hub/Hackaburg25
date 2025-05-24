#include <Arduino.h>
#include <MPU9250_asukiaaa.h>
#include "accelerometer.h"

const int pin_mpu_sda = 21;
const int pin_mpu_scl = 22;
const int ac_threshold = 3;

MPU9250_asukiaaa mpu;

int ac_state = 0; // 0 = normal, no movement
// 1 = first movement detected, need to wait 10 secs
// 2 = 10 secs passed, wait another 10 seconds and check constantly for movement
// 3 = theft detected, handling (alarm is sounding)
unsigned int ac_firstmovement = 0;
bool ac_theft = false;

bool ac_is_bike_stolen()
{
    return ac_theft;
}

void ac_reset()
{
    ac_state = 0;
}

void ac_setup()
{
    Wire.begin(pin_mpu_sda, pin_mpu_scl);
    mpu.setWire(&Wire);

    mpu.beginAccel();
    mpu.beginGyro();
    mpu.beginMag();

    uint8_t sensorId;
    int result = mpu.readId(&sensorId);
    if (result == 0) {
        Serial.println("sensorId: " + String(sensorId));
    } else {
        Serial.println("Cannot read sensorId " + String(result));
    }
}


void ac_loop()
{
    int result;
    result = mpu.accelUpdate();
    if (result)
    {
        Serial.println("Cannot read accel values " + String(result));
    }

    if (ac_state == 0)
    {
        if (mpu.accelSqrt() > ac_threshold)
        {
            Serial.println("First movement detected");
            ac_state = 1;
        }
        ac_firstmovement = millis();
    }

    if (ac_state == 1)
    {
        //Serial.println("Checking again after 10 secs");
        if (millis() - ac_firstmovement > 10000)
        {
            ac_state = 2;
            Serial.println("Checking for second movement");
        }
    }

    if (ac_state == 2)
    {
        //Serial.println("Checking for second movement");
        if (millis() - ac_firstmovement > 20000)
        {
            // 10 seconds passed without second movement, go back to sleep
            ac_state = 0;
            Serial.println("No second movement, sleep");
        }
        else if (mpu.accelSqrt() > ac_threshold)
        {
            // second movement detected
            Serial.println("Theft detected!");
            ac_theft = true;
            ac_state = 3;
        }
    }
}