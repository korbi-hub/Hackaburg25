#include "c_esp32.h"

void ESP_Steuerung::A12_Sequence2_FahrenV2X(){

        // Quit if active flag not set
    if(!m_SqActiveNo[2])
        return;

    switch (int_2){ 
    
        // Skip
        case 0:
            break;
        
        // Check variables
        case 1:

        break;

        // Check Bluetooth Connected -> UUID false: go on ansonsten falsch Sq.
        case 2:

        break;

        // UUID wrong
        case 3:

        break;

        // Send Message to App
        case 4:

        break;

        // Wait Message Received
        case 5:

        break;

        default:
            int_2 = 0;
        break;
    }
    return;
}