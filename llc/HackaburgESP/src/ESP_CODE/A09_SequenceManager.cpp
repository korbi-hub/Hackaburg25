#include "c_esp32.h"

// Regelt, wann welche Sequenz aktiv ist
void ESP_Steuerung::A09_SequenceManager()
{
    bool m_NoSequenceActive = true;
    // check if no Sq active
    for(int i = 0; i < NoOfSequences; i++){
        if(m_SqActiveNo[i] == true){
            m_NoSequenceActive = false;
        }
    }

    // Check if any Sequence is active rn
    if(!m_NoSequenceActive)
        return;

    // Sq0 to call
    // Sq: Registrierung; 
    // not registered
    if(!m_Registered){
        m_SqActiveNo[0] = true;
        return;
    }

    // Sq1 to call
    // Sq: Aufsperren
    // registered and locked
    if  ( 
                m_Registered 
            &&  m_BikeLocked
        ){
        m_SqActiveNo[1] = true;
        return;
    }

    // Sq2 to call
    // Sq: Fahren V2X
    // registered, driving
    if  (
                m_Registered 
            &&  !m_BikeLocked
            &&  m_Driving
            //&&  m_Connected ??
        ){
            m_SqActiveNo[2] = true;
            return;

    }

    // Sq3 to call
    // Sq: 
    // Sq4 to call

    // Sq5 to call



}