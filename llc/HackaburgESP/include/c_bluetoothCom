#pragma once

#include <string>
#include <iostream>

class BluetoothCom{
public:
std::string getComm(); // liefert String ohne extra Protokoll an Hauptklasse
void sendComm(std::string);    // macht String Protokollreif und sendet dann an App
bool isConnected(std::string* str_UUID); // gibt Status von connected aus und liefert ggf. gelesene UUID
private:
    bool connected;
};