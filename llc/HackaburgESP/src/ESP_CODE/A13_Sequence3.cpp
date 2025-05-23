#include "c_esp32.h"

void ESP_Steuerung::A13_Sequence3_Zusperren(){

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

        // 
        case 4:

        break;

        // 
        case 5:

        break;

        // 
        case 6:

        break;

        // 
        case 7:

        break;

        // 
        case 8:

        break;


        default:
            int_3 = 0;
        break;
    }
    return;
}