#pragma once

#include <string>
#include <iostream>

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
enum class Sequence {
        None = 0,
        Einrichtung0 = 1,
        Entsperren1 = 2,
        Fahren2 = 3,
        Sperren3 = 4,
        WrongUUID4 = 5,
        Beschleunigungssensor5 = 6
    };
private:
    // variables
    bool m_Connected, m_Registered, m_BikeLocked, m_Driving;
    std::string UUID;
    Sequence ENUM_ActiveSequence;

    //Electronics c_electric;
    //BluetoothCom c_blueCom;

    // 6 Sequenzarten:
    // Sequenz 0: Einrichtung
    int int_0;
    bool m_Sq0_Active;
    // Sequenz 1: Aufsperren
    int int_1;
    bool m_Sq1_Active;
    // Sequenz 2: Fahren (V2X)
    int int_2;
    bool m_Sq2_Active;
    // Sequenz 3: Zusperren
    int int_3;
    bool m_Sq3_Active;
    // Sequenz 4: Falsche UUID
    int int_4;
    bool m_Sq64_Active;
    // Sequenz 5: Beschleunigungssensor geht an
    int int_5;
    bool m_Sq5_Active;
};