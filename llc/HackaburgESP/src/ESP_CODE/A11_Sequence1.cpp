#include "c_esp32.h"
#include <cstring>
#include <Arduino.h>

void ESP_Steuerung::A11_Sequence1_Aufsperren(){

    // Quit if active flag not set
    if(!m_SqActiveNo[1])
    {
        int_Sq[1] = 0;
        return;
    }   

    switch (int_Sq[1]){ 
    
        // Skip
        case 0:
            break;
        
        // Check variables
        case 1:
            if  (
                        !m_Registered
                    ||  !m_BikeLocked
                )
            {
                m_SqActiveNo[1] = false;
                return;
            }
            int_Sq[1]++;
        break;

        // Check Bluetooth Connected
        case 2:
            if(m_Connected)
                int_Sq[1]++;
        break;

        // Wait for Command (& therefore UUID)
        case 3:
            if(strcmp(c_blueCom.getComm().c_str(),"unlock") == 0) // TODO muesste nicht unlock sein
                int_Sq[1]++;
        break;
        
        // Open lock
        case 4:
            c_electric.ServoMotorOpen(true);
            int_Sq[1]++;
        break;

        // wait lock opened -> @grk kann man nicht wirklich feststellen
        case 5:
            delay(500);
            int_Sq[1]++;
        break;

        // Confirm command executed
        case 6:
            c_blueCom.sendComm("Lock Open");
            int_Sq[1] = 0;
            m_SqActiveNo[1] = false;
            m_Driving = true;
        break;
        
        default:
            int_Sq[1] = 0;
        break;
    }
    return;
}