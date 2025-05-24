#include "c_bluetoothCom.h"



BluetoothCom::BluetoothCom(){
    BLE.begin();
}

 // liefert String ohne extra Protokoll an Hauptklasse
std::string BluetoothCom::getComm(){
    return "";
}

 // macht String Protokollreif und sendet dann an App
void BluetoothCom::sendComm(std::string){


}   
bool BluetoothCom::isConnected(std::string* str_UUID){
    
    return false;} // gibt Status von connected aus und liefert ggf. gelesene UUID