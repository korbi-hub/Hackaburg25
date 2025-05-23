#include <Arduino.h>
#include "c_electric.h"

void turnOnLed(bool R, bool G, bool B)
{
    // Write according to input
    digitalWrite(PIN_LED_RED,   R ? HIGH : LOW);
    digitalWrite(PIN_LED_GREEN, G ? HIGH : LOW);
    digitalWrite(PIN_LED_BLUE,  B ? HIGH : LOW);
}


void activateBuzzer(bool m_buzzerOn) {  // buzzer buzzes when buzzeron is true
    digitalWrite(PIN_BUZZER, m_buzzerOn ? HIGH : LOW);
}


// if true: open position | if false: closed position
void ServoMotorOpen(bool m_Open) {
    if (m_Open) {
        myServo.write(180);  // Open position
    } else {
        myServo.write(90);   // Closed position
    }
}     