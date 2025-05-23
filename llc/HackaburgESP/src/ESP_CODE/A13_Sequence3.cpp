#include "c_esp32.h"

void ESP_Steuerung::A13_Sequence3_Zusperren(){

        // Quit if active flag not set
    if(!m_SqActiveNo[3])
        return;

    switch (int_3){ 
    
        // Skip
        case 0:
            break;
        
        // Check Bluetooth Connection
        case 1:

        break;

        // Connect (if necessary)
        case 2:

        break;

        // Wait Button Pushed
        case 3:

        break;

        // End Sq 2
        case 4:

        break;

        // Lock
        case 5:

        break;


        default:
            int_3 = 0;
        break;
    }
    return;
}