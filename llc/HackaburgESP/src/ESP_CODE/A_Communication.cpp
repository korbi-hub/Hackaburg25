#include "c_esp32.h"

// Wichtige Variablen werden zyklisch hier ausgelesen
void ESP_Steuerung::A02_CommIn()
{
    // check connection
    m_Connected = c_blueCom.isConnected(&UUID);

    // Check Accel dings
    /*if (c_electric.accelsensorAlarm)  // @cosmin
    {
        m_SqActiveNo[4] = true;
    }
    */

    // button Activated from entprelltem signal
    m_buttonLockPressed = c_electric.buttonActivated(PIN_LOCK_BUTTON);
    m_buttonUnlockPressed = c_electric.buttonActivated(PIN_UNLOCK_BUTTON);

}

// Zyklische Comm nach aussen, falls es sowas gibt
void ESP_Steuerung::A31_CommOut()
{
    c_electric.alarm(m_AlarmOn);
}