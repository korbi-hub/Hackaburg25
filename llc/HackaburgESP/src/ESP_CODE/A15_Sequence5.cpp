#include "c_esp32.h"

void ESP_Steuerung::A15_Sequence5_Beschleunigungssensor(){


            // Quit if active flag not set
    if(!m_SqActiveNo[5])
        return;

    switch (int_5){ 
    
        // Skip
        case 0:
            break;
        
        // 
        case 1:

        break;

        // 
        case 2:

        break;

        // 
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
            int_5 = 0;
        break;
    }
    return;
}