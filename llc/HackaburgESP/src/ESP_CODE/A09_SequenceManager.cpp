#include "c_esp32.h"

// Regelt, wann welche Sequenz aktiv ist
void ESP_Steuerung::A09_SequenceManager()
{
    // Sq0 to call
    // Sq: Registrierung; 
    // not registered
    if(!m_Registered){
        m_SqActiveNo[0] = true;
        return;
    }
    else{
       m_SqActiveNo[0] = false; 
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
    else{

    }

    // Sq2 to call
    // Sq: Fahren V2X
    // registered, driving ALSO waiting to close
    if  (
                m_Registered 
            &&  !m_BikeLocked
            &&  m_Driving
            //&&  m_Connected ??
        ){
            m_SqActiveNo[2] = true;
            m_SqActiveNo[3] = true;
            return;

    }

    // Sq3 to call
    // Immer ready to lock wenn registered
    if(
            m_Registered
        &&  !m_BikeLocked
    ){
        m_SqActiveNo[3] = true;
    }

    // Sq4 to call
    // Sq: Falsche UUID
    // Wird von anderen Sq gerufen

    // Sq5 to call
    // Sq: Bewegungssensor
    // Wird von CommIn aufgerufen


}