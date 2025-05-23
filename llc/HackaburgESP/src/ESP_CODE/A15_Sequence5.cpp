#include "c_esp32.h"

void ESP_Steuerung::A15_Sequence5_Beschleunigungssensor(){

            // Quit if active flag not set
    if(!m_SqActiveNo[5])
        return;

    char str_textbuffer[255];
    switch (int_5){ 
    
        // Skip
        case 0:
            break;
        
        // Alarm & send to App
        case 1:
            c_blueCom.sendComm("Fremder Versuchszugriff"); 
            c_electric.alarm(true);
        break;

        // Wait App cancelling @grk hier noch handshake mit app?
        case 2:
            strcpy(str_textbuffer, c_blueCom.getComm().c_str());
            if(strcmp(str_textbuffer, "Chill"))
            {
                int_5++;
            }
        break;

        // Cancel Alarm
        case 3:
            c_electric.alarm(true);
            int_5++;
        break;

        // Send to App Alarm cancelled
        case 4:
            c_blueCom.sendComm("Alarm Cancelled");
            int_5 = 0;
            m_SqActiveNo[5] = false;
        break;




        default:
            int_5 = 0;
        break;
    }
    return;
}