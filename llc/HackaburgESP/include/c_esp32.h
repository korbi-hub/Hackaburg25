#pragma once

#include <string>
#include <iostream>
#define NoOfSequences 6

class ESP_Steuerung{
public:
/////////////////////// FUNKTIONEN ////////////////////////////////
// Schritte
void A01_Setup();       // Einmaliges Variablensetup
void A02_CommIn();      // Input (Sensorik und Bluetooth) abfragen
void A03_SetFlags();    // Flags anpassen

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
    // variables
    bool m_Connected, m_Registered, m_BikeLocked, m_Driving;
    std::string UUID;

    //Electronics c_electric;
    //BluetoothCom c_blueCom;

    // Sequences
    bool m_SqActiveNo[NoOfSequences];

    // 6 Sequenzarten:
    // Sequenz 0: Einrichtung
    int int_0;
    // Sequenz 1: Aufsperren
    int int_1;
    // Sequenz 2: Fahren (V2X)
    int int_2;
    // Sequenz 3: Zusperren
    int int_3;
    // Sequenz 4: Falsche UUID
    int int_4;
    // Sequenz 5: Beschleunigungssensor geht an
    int int_5;
};