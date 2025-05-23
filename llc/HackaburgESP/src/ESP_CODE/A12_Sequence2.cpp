#include "c_esp32.h"

void ESP_Steuerung::A12_Sequence2_FahrenV2X(){

        // Quit if active flag not set
    if(!m_SqActiveNo[2])
    {
        int_2 = 0;
        return;
    }
    std::string tempUUID;
    
    switch (int_2){ 
    
        // Skip
        case 0:

        break;
        
        // Check variables
        case 1:
            if  (
                        !m_Registered 
                    ||  m_BikeLocked
                    ||  !m_Driving
                )
            {
                m_SqActiveNo[2] = false;
                return;
            }
            int_2++;
        break;

        // Check Bluetooth Connected -> UUID false: go on ansonsten falsch Sq.
        case 2:
            
            if(c_blueCom.isConnected(&tempUUID))
            {
                // different UUID
                if(strcmp(tempUUID, UUID) != 0)
                    int_2++;
            }

        break;

        // Send Message to App
        case 3:
            c_blueCom.sendComm("Neuer Fahrer on da street");
            int_2 = 0;
            m_SqActiveNo[2] = 0;
        break;


        default:
            int_2 = 0;
        break;
    }
    return;
}