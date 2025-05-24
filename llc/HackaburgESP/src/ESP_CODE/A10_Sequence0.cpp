#include "c_esp32.h"
#include <cstring>
#include <Arduino.h>

void ESP_Steuerung::A10_Sequence0_Einrichtung(){

    // Quit if active flag not set
    if(!m_SqActiveNo[0])
    {
        // reset variables
        int_Sq[0] = 0;
        m_sq0_first = true;
        return;
    }
        
    switch (int_Sq[0]){ 
    
        // Skip
        case 0:
            break;
        
        // Variablen Check
        case 1:

            if(m_Registered)
            {
                m_SqActiveNo[0] = false;
                return;
            }   
            int_Sq[0]++;
        break;

        // RFID Authorization Check
        case 2:
            // RFID Authorisation
            if(c_electric.RFID(UUID))
            {
                int_Sq[0]++;
                m_sq0_first = true;
            }                
            else
                return;
        break;

        // RFID Authorization Successfull -> Check connection available Bluetooth
        case 3:
            // waere bloed wenn jemand anderes sich damit verbindet!
            if(c_blueCom.isConnected(&UUID))
            {
                // successful registration
                m_Registered = true;
            }
        break;

        // End handshake App
        case 4:
            m_SqActiveNo[0] = false;
            int_Sq[0] = 0;
        break;


        default:
            int_Sq[0] = 0;
            m_SqActiveNo[0] = false;
    }

    return;
}