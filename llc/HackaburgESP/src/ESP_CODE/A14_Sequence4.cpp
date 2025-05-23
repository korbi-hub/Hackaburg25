#include "c_esp32.h"

void ESP_Steuerung::A14_Sequence4_FalscheUUID(){

    // Quit if active flag not set
    if(!m_SqActiveNo[4])
        return;

    switch (int_4){ 
    
        // Skip
        case 0:
            break;
        
        // Warning To Phone (Anderer Verkehrsteilnehmer oder Fehlerhafter zugriff)
        case 1:

        break;

        // Wait Antowrt
        case 2:

        break;

        default:
            int_4 = 0;
        break;
    }
    return;
}