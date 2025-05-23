#include "c_esp32.h"

void ESP_Steuerung::A10_Sequence0_Einrichtung(){

    // Quit if active flag not set
    if(!m_SqActiveNo[0])
        return;
    
    switch (int_0){ 
    
        // Skip
        case 0:
            break;
        
        // Variablen Check
        case 1:

        break;

        // RFID Authorization Check
        case 2:

        break;

        // RFID Authorization Successfull -> Send UUID via Bluetooth
        case 3:

        break;

        // Wait for answer App
        case 4:

        break;

        // End handshake App
        case 5:

        break;


        default:
            int_0 = 0;
        break;
    }
    return;
}