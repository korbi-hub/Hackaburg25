#pragma once

#include <string>
#include <iostream>
#include <Arduino.h>

#include "c_electric.h"
#include "c_bluetoothCom.h"

#define NoOfSequences 6

class ESP_Steuerung{
public:
/////////////////////// FUNKTIONEN ////////////////////////////////
// Schritte
void A01_Setup();       // Einmaliges Variablensetup
void A02_CommIn();      // Input (Sensorik und Bluetooth) abfragen
void A03_SetFlags();    // Flags anpassen

void A05_AppCommand();
// Sequences
void A09_SequenceManager();     // regelt wann welche Sequenz läuft
void A10_Sequence0_Einrichtung();
void A11_Sequence1_Aufsperren();
void A12_Sequence2_FahrenV2X();
void A13_Sequence3_Zusperren();
void A14_Sequence4_FalscheUUID();
void A15_Sequence5_Beschleunigungssensor();


//Schritte
void A30_Messages();    // Möglicherweise Anpassen von Messages
void A31_CommOut();     // Output (Bluetooth Com) ausgeben


/////////////////////// VARIABLEN ///////////////////////////////////

private:
    // system flags
    bool m_Connected, m_Registered, m_BikeLocked, m_Driving, m_AlarmOn;

    std::string UUID;
    
    Electronic c_electric;
    BluetoothCom c_blueCom;
    
    // variables
    bool m_buttonPressed = false;

    
    // Sequences
    bool m_SqActiveNo[NoOfSequences];

    // 6 Sequenzarten:
    // Sequenz 0: Einrichtung
    int int_0 = 0;
    unsigned long sq0_timeout = 5000; // 5 Sekunden
    unsigned long sq0_startTime;
    bool m_sq0_first;
    // Sequenz 1: Aufsperren
    int int_1 = 0;
    // Sequenz 2: Fahren (V2X)
    int int_2 = 0;
    // Sequenz 3: Zusperren
    int int_3 = 0;
    // Sequenz 4: Falsche UUID
    int int_4 = 0;
    // Sequenz 5: Beschleunigungssensor geht an
    int int_5 = 0;

};