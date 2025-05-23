#pragma once
#include "PINs.h"
#include <Servo.h>

class Electronic{
public:
    Electronic();
    void turnOnLed(bool R, bool G, bool B);
    void activateBuzzer(bool m_buzzerOn);   // buzzer buzzes when buzzeron is true
    void ServoMotorOpen(bool m_Open);       // if true: open position | if false: closed position

    void alarm(bool m_AlarmOn);             // alarm logic if true / stop all if false
    bool Connection(bool m_ConnectSuccess); // short celebration, send true if done with animation
    
    bool AccelSensorTriggered();    // evaluate sensor data
    bool buttonActivated(); // mit button library entprellen?
    bool RFID(std::string& UUID_Pointer);   // return: true if scan was correct / give "UUID_Pointer" the value 
private:
    long GetValueAccelSensor();
    Servo myServo;
};