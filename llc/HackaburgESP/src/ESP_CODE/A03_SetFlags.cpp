#include "c_esp32.h"

// Verarbeitet Flags die benutzt werden
void ESP_Steuerung::A03_SetFlags()
{
    std::string* dummy;
    m_Connected = c_blueCom.isConnected(dummy);

    if(m_Registered)
    {
        c_blueCom.enableDataTraffic();
    }
    else
    {
        c_blueCom.disableDataTraffic();
    }

    if(m_BikeLocked)
    {
        m_Driving = false;
    }

    if(     
            m_AlarmOn
        &&  (millis() - t_AlarmOnTime > 5000)   // nach 5s alarm beenden
    )
    {
        m_AlarmOn = false;
    }
    else{
        t_AlarmOnTime = millis();
    }
}