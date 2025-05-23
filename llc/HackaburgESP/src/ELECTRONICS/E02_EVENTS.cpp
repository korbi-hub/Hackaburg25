#include "c_electric.h"


#define ALARM_BLINK_DELAY 300  // ms Blink-Intervall

void Electronic::alarm(bool m_AlarmOn) {
    static unsigned long lastToggleTime = 0;
    static bool ledState = false;

    if (!m_AlarmOn) {
        // Alles aus
        turnOnLed(false, false, false);
        activateBuzzer(false);
        return;
    }

    unsigned long currentTime = millis();
    if (currentTime - lastToggleTime >= ALARM_BLINK_DELAY) {
        lastToggleTime = currentTime;
        ledState = !ledState;  // LED umschalten

        turnOnLed(ledState, false, false);       // Rot an/aus blinkend
        activateBuzzer(ledState);                  // Buzzer synchron an/aus
    }
}

bool Electronic::Connection(bool m_ConnectSuccess) {
    if (!m_ConnectSuccess) return false;

    for (int i = 0; i < 2; i++) {
        turnOnLed(false, true, true); // Grün + Blau (Cyan)
        activateBuzzer(true);
        delay(150);

        turnOnLed(false, false, false);
        activateBuzzer(false);
        delay(150);
    }

    return true;
}