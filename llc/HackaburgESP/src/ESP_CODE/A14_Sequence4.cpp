#include "c_esp32.h"

void ESP_Steuerung::A14_Sequence4_FalscheUUID(){

    // Quit if active flag not set
    if(!m_SqActiveNo[4])
        return;
    char str_textbuffer[255];
    switch (int_4){ 
    
        // Skip
        case 0:
            break;
        
        // Warning To Phone (Anderer Verkehrsteilnehmer oder Fehlerhafter zugriff)
        case 1:
            // anderer Verkehrsteilnehmer
            if(m_Driving)
            {
                c_blueCom.sendComm("Anderer Verkehrsteilnehmer in der Nähe");
                c_electric.activateBuzzer(true);
                delay(1500);
                c_electric.activateBuzzer(false);
                int_4 = 0;
            }
            // Fremder Zugriffsversuch
            else
            {
                c_blueCom.sendComm("Fremder Versuchszugriff"); // TODO
                int_4++;
            }
        break;

        // Wait Antwort auf fremden Versuchszugriff
        case 2:
            strcpy(str_textbuffer, c_blueCom.getComm().c_str());
            if(strcmp(str_textbuffer, "ALARM"))
            {
                c_electric.alarm(true);
                int_4 = 0;
            }
            else if(strcmp(str_textbuffer, "Chill"))
            {
                int_4 = 0;
            }

        break;

        default:
            int_4 = 0;
        break;
    }
    return;
}