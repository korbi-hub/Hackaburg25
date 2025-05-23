#include "c_esp32.h"

void ESP_Steuerung::A11_Sequence1_Aufsperren(){

    // Quit if active flag not set
    if(!m_SqActiveNo[1])
        return;

    switch (int_1){ 
    
        // Skip
        case 0:
            break;
        
        // Check variables
        case 1:
            if
                (
                        !m_Registered
                    ||  !m_BikeLocked
                )
            {
                m_SqActiveNo[1] = false;
            }
            int_1++;
        break;

        // Check Bluetooth Connected
        case 2:
            if(m_Connected)
                int_1++;
        break;

        // Wait for Command (& therefore UUID)
        case 3:
            if(strcmp(c_blueCom.getComm(),"InputString") == 0) // TODO
                int_1++;
        break;
        
        // Open lock
        case 4:
            c_electric.ServoMotorOpen(true);
            int_1++;
        break;

        // wait lock opened -> @grk kann man nicht wirklich feststellen
        case 5:
            delay(500);
            int_1++;
        break;

        // Confirm command executed
        case 6:
            c_blueCom.sendComm("Lock Open");
            int_1 = 0;
            m_SqActiveNo[1] = false;
        break;
        
        default:
            int_1 = 0;
        break;
    }
    return;
}