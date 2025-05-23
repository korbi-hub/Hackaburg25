#include <Arduino.h>
#include "c_electric.h"

void Electronic::turnOnLed(bool R, bool G, bool B)
{
    // Write according to input
    digitalWrite(PIN_LED_RED,   R ? HIGH : LOW);
    digitalWrite(PIN_LED_GREEN, G ? HIGH : LOW);
    digitalWrite(PIN_LED_BLUE,  B ? HIGH : LOW);
}


void Electronic::activateBuzzer(bool m_buzzerOn) {  // buzzer buzzes when buzzeron is true
    digitalWrite(PIN_BUZZER, m_buzzerOn ? HIGH : LOW);
}


// if true: open position | if false: closed position
void Electronic::ServoMotorOpen(bool m_Open) {
    myServo.write(m_Open ? 90 : 0);
}     