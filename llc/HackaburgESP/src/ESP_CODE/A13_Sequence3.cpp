#include "c_esp32.h"

void ESP_Steuerung::A13_Sequence3_Zusperren(){

        // Quit if active flag not set
    if(!m_SqActiveNo[3])
        return;
    
    std::string dummy;
    
    switch (int_3){ 
    
        // Skip
        case 0:
            break;
        
        // Check Bluetooth Connection
        case 1:
            if(
                    !m_Registered
                ||  m_BikeLocked
            )
            {
                m_SqActiveNo[3] = 0;
                return;
            }
            int_3++;
        break;

        // Connect (if necessary)
        case 2:
            if(c_blueCom.isConnected(&dummy))
            {
                int_3++;
            }
        break;

        // Wait Button Pushed
        case 3:
            if(m_buttonPressed)
            {
                int_3++;
            }
        break;

        // End Sq 2
        case 4:
            m_Driving = false;
            m_SqActiveNo[2] = false;
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