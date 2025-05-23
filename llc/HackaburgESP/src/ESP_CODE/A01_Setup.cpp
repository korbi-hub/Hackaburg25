#include "c_esp32.h"

// laeuft einmal am Anfang durch, um die Variablen richtig zu initialisieren
void ESP_Steuerung::A01_Setup()
{
    c_blueCom = BluetoothCom(); // TODO Constructor einbauen
    c_electric = Electronic();  // TODO Constructor einbauen

    // set all Sq to 0
    for(int i = 0; i < NoOfSequences; i++)
    {
        m_SqActiveNo[i] = false;
    }

    m_Connected = false;
    m_Driving = false;
    m_Registered = false;

    // Sequences
    m_sq0_first = false;

    // motor auf grundposition fahren
}