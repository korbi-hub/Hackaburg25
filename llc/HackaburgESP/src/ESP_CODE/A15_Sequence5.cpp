#include "c_esp32.h"

void ESP_Steuerung::A15_Sequence5_Beschleunigungssensor(){

            // Quit if active flag not set
    if(!m_SqActiveNo[5])
        return;

    switch (int_5){ 
    
        // Skip
        case 0:
            break;
        
        // Alarm & send to App
        case 1:

        break;

        // Wait App cancelling @grk hier noch handshake mit app?
        case 2:

        break;

        // Cancel Alarm
        case 3:

        break;

        // Send to App Alarm cancelled
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
            int_5 = 0;
        break;
    }
    return;
}