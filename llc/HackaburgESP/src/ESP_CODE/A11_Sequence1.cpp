#include "c_esp32.h"

void ESP_Steuerung::A11_Sequence1_Aufsperren(){

    switch (int_1){ 
    
        // Skip
        case 0:
            break;
        
        // Check variables
        case 1:

        break;

        // Check Bluetooth Connected
        case 2:

        break;

        // Wait for Command (& therefore UUID)
        case 3:

        break;
        
        // Open lock
        case 4:

        break;

        // wait lock opened -> @grk kann man nicht wirklich feststellen
        case 5:

        break;

        // Confirm command executed
        case 6:

        break;

        default:
            int_1 = 0;
        break;
    }
    return;
}