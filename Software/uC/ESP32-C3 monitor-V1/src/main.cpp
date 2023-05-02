#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>

const char *ssid = "ESP32-AP"; // Set the SSID (network name) of the access point

IPAddress staticIP(192, 168, 0, 1); // Set your desired static IP address
IPAddress gateway(192, 168, 0, 1);  // Set your network gateway address
IPAddress subnet(255, 255, 255, 0); // Set your network subnet mask

WebServer server(80); // Create a web server on port 80

static const char html[] PROGMEM = R"rawliteral(
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ESP32 AP Setup</title>
</head>

<body style="background-color: rgb(236, 236, 236);">
    <div
        style="background-color: rgb(215, 227, 255); border:0.25em rgb(0, 24, 109) solid; border-radius: 3em; margin: 2em;">
        <div style="justify-content:center; display:flex">
            <h1>ESP32 Access Point Setup</h1>
            <br>
        </div>
        <div style="justify-content:center; display:flex;">
            <form method='post' action='/connect'>
                <br>
                <input type='text' id='ssid' name='ssid' placeholder="WiFi SSID" required><br>
                <input type='password' id='password' name='password' placeholder="WiFi-Password" required><br>
                <input type="checkbox" name="saveWiFi" id="saveWiFi">
                <label for="saveWiFi">Save WiFi SSID and Password</label><br>
                <br>
                <input type="email" name="email-name" id="email-name" placeholder="Firebase-Email" required><br>
                <input type="password" name="email-password" id="email-password" placeholder="Firebase-Password"required><br>
                <input type="checkbox" name="saveFirebase" id="saveFirebase">
                <label for="saveFirebase">Save Firebase credentials</label><br>
                <br>
                <input type='submit' value='Connect' style="margin-bottom: 1em;">
            </form>
        </div>
    </div>
    <style>
        input
{
height:
  2em;
width:
  auto;
  border - radius : 0.5em;
  margin - top : 0.1em;
} 
</ style>
    </ body>
    </ html>)rawliteral";

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