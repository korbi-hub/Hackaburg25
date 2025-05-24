#include "c_bluetoothCom.h"



BluetoothCom::BluetoothCom(){
    BLE = new BLEHandler();
    Serial.printf("in bluetoothCom");
    BLE->begin();
    Serial.printf("bluetootj setup done");
}

 // liefert String ohne extra Protokoll an Hauptklasse
std::string BluetoothCom::getComm(){
    std::string data = BLE->getLastReceived();
    if(     
            registered
        &&  (millis() - BLE->receiveTime) <= 5000
    )
        return data;
    else
        return "NOT_REGISTERED";
}

 // macht String Protokollreif und sendet dann an App
void BluetoothCom::sendComm(std::string dataOut){
    if(registered)
        BLE->send(dataOut);
}   
bool BluetoothCom::isConnected(std::string* str_UUID){
    BLE->isConnected();
    *str_UUID = BLE->getUUID();
    return false;
} // gibt Status von connected aus und liefert ggf. gelesene UUID


// enable Data traffic after registration
void BluetoothCom::enableDataTraffic(){
    //ESP can send/receive data
    registered = true;
}

void BluetoothCom::disableDataTraffic(){
    //ESP cant receive stuff
    registered = false;
}