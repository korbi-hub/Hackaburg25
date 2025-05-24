#include "c_electric.h"

bool Electronic::AccelSensorTriggered(){return 0;}    // evaluate sensor data

// mit button library entprellen?
bool Electronic::buttonActivated(short buttonPin){ 
    const unsigned long now = millis();

    // 1) aktuellen Tasterpegel einlesen
    const bool pressed = (digitalRead(buttonPin) == LOW); // LOW = gedrückt (Pull-up)

    // 2) Flanke erkennen – nur reagieren, wenn Pegel von „nicht gedrückt“
    //    auf „gedrückt“ wechselt (entprellt genügt hier meist, weil nur eine
    //    Flankenerkennung statt Dauerabfrage)
    if (pressed && !_lastPhysical) {
        _latched     = true;            // Aktiv markieren
        _activatedAt = now;             // Startzeit merken
    }
    _lastPhysical = pressed;            // Zustand für nächste Runde speichern

    // 3) Haltezeit abgelaufen?
    if (_latched && (now - _activatedAt >= HOLD_MS)) {
        _latched = false;
    }

    // 4) latched-Zustand zurückgeben (true während Haltefenster)
    return _latched;
} 


bool Electronic::RFID(std::string& UUID_Pointer){return 0;}   // return: true if scan was correct / give "UUID_Pointer" the value 

long Electronic::GetValueAccelSensor(){return 0;}