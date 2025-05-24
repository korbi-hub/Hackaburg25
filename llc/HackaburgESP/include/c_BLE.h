#ifndef BLE_HANDLER_H
#define BLE_HANDLER_H

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <functional>
#include <string>

/**
 * @brief Kapselt alle BLE‑Funktionen in einer handlichen Klasse.
 *
 * - begin()   : initialisiert BLE, startet Advertising
 * - loop()    : Platzhalter (für zukünftige Erweiterungen)
 * - send()    : sendet Daten an den verbundenen Client
 * - isConnected(): prüft, ob ein Client verbunden ist
 * - setReceiveCallback(): legt Callback für empfangene Daten fest
 */
class BLEHandler {
public:
    using ReceiveCallback = std::function<void(const std::string&)>;

    BLEHandler(const std::string& deviceName = "ESP32",
               const std::string& serviceUUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b",
               const std::string& characteristicUUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8");

    void begin();                    // BLE starten
    void loop();                     // optional in deinem Sketch aufrufen
    bool isConnected() const;        // true, wenn Client verbunden

    void send(const std::string& data);               // Daten an Client
    void setReceiveCallback(ReceiveCallback cb);      // eingehende Daten‑Callback

private:
    // interne Callback‑Klassen
    class ServerCallbacks;
    class CharacteristicCallbacks;

    std::string _deviceName;
    std::string _serviceUUID;
    std::string _characteristicUUID;

    BLEServer* _server = nullptr;
    BLECharacteristic* _characteristic = nullptr;
    bool _deviceConnected = false;

    ReceiveCallback _receiveCallback = nullptr;

    // Helfer, von statischen BLE‑Callbacks aufgerufen
    void _onConnect();
    void _onDisconnect();
    void _onWrite(const std::string& data);

    // Singleton‑Zeiger, damit die statischen BLE‑Callbacks auf das Objekt zugreifen können
    static BLEHandler* _instance;
};

#endif // BLE_HANDLER_H
