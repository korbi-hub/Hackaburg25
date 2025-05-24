#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>

const char *ssid = "Pedestrian";
const char *password = "1234567890";
const int v2x_rssi_threshold = -40;
IPAddress localIP(10, 145, 220, 206);
IPAddress gatewayIP(192,168,43,1);
IPAddress subnetIP(255,255,0,0);

const unsigned long v2x_loop_period = 100;
unsigned long v2x_loop_last = 0;
WebServer server;
bool v2x_too_close = false;

void v2x_handle_root()
{
    server.send(200, "text/html", v2x_too_close ? "true" : "false");
}

bool v2x_is_too_close()
{
    return v2x_too_close;
}

void v2x_setup()
{
    WiFi.config(localIP, gatewayIP, subnetIP);
    WiFi.begin(ssid, password);


    server.on("/", v2x_handle_root);
    server.begin();
    Serial.println(WiFi.localIP());
}

int RSSI_sum = 0;
int RSSI_count = 0;

void v2x_loop()
{
    if (millis() - v2x_loop_last < v2x_loop_period)
        return;
    v2x_loop_last = millis();
    if (!WiFi.isConnected())
    {
        Serial.println("Pedestrian WiFi not connected!");
        return;
    }

    server.handleClient();
    RSSI_sum += WiFi.RSSI();
    RSSI_count++;
    if (RSSI_count == 10)
    {
        int average = RSSI_sum/RSSI_count;
        Serial.println("RSSI: " + String(average));
        if (average > v2x_rssi_threshold)
        {
            Serial.println("too close!");
            v2x_too_close = true;
        }
        else
        {
            v2x_too_close = false;
        }
        RSSI_count = 0;
        RSSI_sum = 0;
    }
}
