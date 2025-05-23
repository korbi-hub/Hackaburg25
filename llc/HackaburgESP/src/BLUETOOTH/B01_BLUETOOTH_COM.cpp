#include "c_bluetoothCom.h"

BluetoothCom::BluetoothCom(){}
std::string BluetoothCom::getComm(){return "";} // liefert String ohne extra Protokoll an Hauptklasse
void BluetoothCom::sendComm(std::string){}    // macht String Protokollreif und sendet dann an App
bool BluetoothCom::isConnected(std::string* str_UUID){return false;} // gibt Status von connected aus und liefert ggf. gelesene UUID