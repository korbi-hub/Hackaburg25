#include "c_electric.h"

// setup
Electronic::Electronic(){
    // Configurate PINs
    myServo.setPeriodHertz(50);   // 50 Hz (Standard für Servos)
    myServo.attach(MOTOR_PWM, 500, 2400); // Pin, Min/Max Pulse (µs)
    pinMode(PIN_BUZZER, OUTPUT);
    pinMode(PIN_LED_RED, OUTPUT);
    pinMode(PIN_LED_GREEN, OUTPUT);
    pinMode(PIN_LED_BLUE, OUTPUT);
    
    // Initialize Shit
    ServoMotorOpen(true); // start in open position
    turnOnLed(false, false, false); // LEDs aus beim Start
    activateBuzzer(false);  // turn off buzzer
}