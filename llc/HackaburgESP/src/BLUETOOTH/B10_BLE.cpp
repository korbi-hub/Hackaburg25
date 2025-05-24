#include "c_BLE.h"
#include <Arduino.h>

// Statische Instanzinitialisierung
BLEHandler* BLEHandler::_instance = nullptr;

// ===== interne Callback‑Klassen ============================
class BLEHandler::ServerCallbacks : public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) override {
        if (BLEHandler::_instance) BLEHandler::_instance->_onConnect();
    }
    void onDisconnect(BLEServer* pServer) override {
        if (BLEHandler::_instance) BLEHandler::_instance->_onDisconnect();
        // Werbung nach Trennung neu starten
        BLEDevice::getAdvertising()->start();
    }
};

class BLEHandler::CharacteristicCallbacks : public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic* pCharacteristic) override {
        if (BLEHandler::_instance) {
            std::string rx = pCharacteristic->getValue();
            BLEHandler::_instance->_onWrite(rx);
        }
    }
};

// ===== öffentliche Methoden ===============================

BLEHandler::BLEHandler(const std::string& deviceName,
                       const std::string& serviceUUID,
                       const std::string& characteristicUUID)
    : _deviceName(deviceName),
      _serviceUUID(serviceUUID),
      _characteristicUUID(characteristicUUID)
{
    _instance = this; // statischen Zeiger setzen
}

void BLEHandler::begin() {
    BLEDevice::init(_deviceName);
    _server = BLEDevice::createServer();
    _server->setCallbacks(new ServerCallbacks());

    BLEService* service = _server->createService(_serviceUUID);

    _characteristic = service->createCharacteristic(
        _characteristicUUID,
        BLECharacteristic::PROPERTY_READ |
        BLECharacteristic::PROPERTY_WRITE |
        BLECharacteristic::PROPERTY_NOTIFY
    );

    _characteristic->setCallbacks(new CharacteristicCallbacks());
    _characteristic->setValue("HELLO");

    service->start();
    BLEDevice::getAdvertising()->start();
    Serial.println("[BLE] Advertising gestartet");
}

void BLEHandler::loop() {
    // hier könnte man periodische Aufgaben ergänzen
}

bool BLEHandler::isConnected() const {
    return _deviceConnected;
}

void BLEHandler::send(const std::string& data) {
    if (_deviceConnected && _characteristic) {
        _characteristic->setValue(data);
        _characteristic->notify();
    }
}

void BLEHandler::setReceiveCallback(ReceiveCallback cb) {
    _receiveCallback = cb;
}

// ===== interne Helfer =====================================

void BLEHandler::_onConnect() {
    _deviceConnected = true;
    Serial.println("[BLE] Client verbunden");
}

void BLEHandler::_onDisconnect() {
    _deviceConnected = false;
    Serial.println("[BLE] Client getrennt");
}

void BLEHandler::_onWrite(const std::string& data) {
    if (_receiveCallback) {
        _receiveCallback(data);
    } else {
        Serial.print("[BLE] Empfangen: ");
        Serial.println(data.c_str());
    }
}
