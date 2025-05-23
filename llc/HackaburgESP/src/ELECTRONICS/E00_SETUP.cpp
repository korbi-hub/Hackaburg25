#include "c_electric.h"

// setup
Electronic::Electronic(){
    // Configurate PINs
    myServo.attach(MOTOR_PWM);
    pinMode(PIN_BUZZER, OUTPUT);
    pinMode(PIN_LED_RED, OUTPUT);
    pinMode(PIN_LED_GREEN, OUTPUT);
    pinMode(PIN_LED_BLUE, OUTPUT);
    
    ServoMotorOpen(true); // start in open position
    turnOnLed(false, false, false); // LEDs aus beim Start
}