#pragma once
#include "PINs.h"

class Electronic{
public:
    void turnOnLed(unsigned char R, unsigned char G, unsigned char B);
    void activateBuzzer(bool m_buzzerOn);
    void alarm(bool m_AlarmOn);
    void Connection(bool m_ConnectSuccess);
    void ServoMotorOpen(bool m_Open);
    
    long GetValueAccelSensor();
    // interrupt für Beschleunigungssensor und auslesen
    bool buttonActivated(); // mit button library entprellen?
    bool RFID();
private:
};