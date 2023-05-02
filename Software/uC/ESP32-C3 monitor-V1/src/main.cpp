#include <Arduino.h>
#include <wifimanager.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>

WIFIMANAGER WifiManager;

const char *ssid = "ESP32-BatteryMagic-AP"; // Set the SSID (network name) of the access point
const char *password = "password123";       // Set the password of the access point

void setup()
{
  Serial.begin(115200);
  // Load well known Wifi AP credentials from NVS
  WifiManager.startBackgroundTask();

  // We do need the Webserver to attach our RESTful API
  AsyncWebServer webServer(80);
  // Attach our API to the Webserver
  WifiManager.attachWebServer(&webServer);
  // Run the Webserver
  webServer.begin();
  Serial.println("Connected to Wi-Fi!");
}

void loop()
{
  // put your main code here, to run repeatedly:
}