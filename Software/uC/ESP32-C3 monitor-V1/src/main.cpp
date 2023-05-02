#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>

const char *ssid = "ESP32-AP"; // Set the SSID (network name) of the access point

IPAddress staticIP(192, 168, 1, 100); // Set your desired static IP address
IPAddress gateway(192, 168, 1, 1);    // Set your network gateway address
IPAddress subnet(255, 255, 255, 0);   // Set your network subnet mask

WebServer server(80); // Create a web server on port 80

String html = // Define the HTML for the Wi-Fi configuration page
    "<html><body>"
    "<form method='post' action='/connect'>"
    "<label for='ssid'>Wi-Fi network name:</label><br>"
    "<input type='text' id='ssid' name='ssid'><br>"
    "<label for='password'>Wi-Fi password:</label><br>"
    "<input type='password' id='password' name='password'><br>"
    "<input type='submit' value='Connect'>"
    "</form>"
    "</body></html>";

void handleRoot()
{
  server.send(200, "text/html", html); // Serve the HTML page
}

void handleConnect()
{
  String ssid = server.arg("ssid");         // Read the SSID from the form data
  String password = server.arg("password"); // Read the password from the form data
  // Do something with the SSID and password (e.g. save to EEPROM or connect to Wi-Fi)
  server.send(200, "text/plain", "Connected to Wi-Fi!"); // Send a response to the browser
  Serial.println(ssid);
  Serial.println(password);
}

void setup()
{
  Serial.begin(115200);
  WiFi.mode(WIFI_AP_STA);                       // AP + STA required because of wifi scan during AP  //WiFi.config(staticIP, gateway, subnet); // Set the static IP configuration
  WiFi.softAP(ssid);                            // Create the access point
  WiFi.softAPConfig(staticIP, gateway, subnet); // Set the static IP configuration
  Serial.println("Access point created");
  Serial.println("IP address: " + WiFi.softAPIP().toString()); // Print the IP address of the access point
  server.on("/", handleRoot);
  server.on("/connect", handleConnect);
  server.begin(); // Start the web server
}

void loop()
{
  server.handleClient(); // Handle incoming client requests
}