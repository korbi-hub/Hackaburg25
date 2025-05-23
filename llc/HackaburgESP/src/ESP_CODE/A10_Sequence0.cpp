#include "c_esp32.h"
#include <cstring>
#include <Arduino.h>

void ESP_Steuerung::A10_Sequence0_Einrichtung(){

    // Quit if active flag not set
    if(!m_SqActiveNo[0])
    {
        // reset variables
        int_0 = 0;
        sq0_startTime = 0;
        m_sq0_first = true;
        return;
    }
        
    switch (int_0){ 
    
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
            int_0++;
        break;

        // RFID Authorization Check
        case 2:
        // set time on first
            if(m_sq0_first)
            {
                m_sq0_first = false;
                sq0_startTime = millis();
                sq0_timeout = 10000;
            }
            
            // RFID Authorisation
            if(c_electric.RFID(UUID))
            {
                int_0++;
                m_sq0_first = true;
            }    
            
            //check if timeout 
            else if(sq0_startTime > sq0_timeout)
                m_SqActiveNo[0] = false;
            
            else
                return;
        break;

        // RFID Authorization Successfull -> Send UUID via Bluetooth
        case 3:
            c_blueCom.sendComm("RFID Successfull"); // TODO
        break;

        // Wait for answer App
        case 4:
           
            // set time on first
            if(m_sq0_first)
            {
                m_sq0_first = false;
                sq0_startTime = millis();
                sq0_timeout = 10000;
            }
            if(strcmp(c_blueCom.getComm().c_str(),"InputString") == 0) // TODO
            {
                 int_0++;
                 m_sq0_first = true;
            }   
             //check if timeout 
            else if(sq0_startTime > sq0_timeout)
                m_SqActiveNo[0] = false;
            
            else
                return;
        break;

        // End handshake App
        case 5:
            m_Registered = true;
            m_SqActiveNo[0] = false;
            int_0 = 0;
        break;


        default:
            int_0 = 0;
            m_SqActiveNo[0] = false;
    }

    return;
}