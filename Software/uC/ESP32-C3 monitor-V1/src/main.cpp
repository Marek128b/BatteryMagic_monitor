#include <Arduino.h>
#include <WiFi.h>
#include <SPIFFS.h>
#include <ArduinoJson.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include <FirebaseESP32.h>
// Provide the token generation process info.
#include "addons/TokenHelper.h"
// Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert Firebase project API Key
#define API_KEY "AIzaSyBHIc9XTrsoHxUlgKc1kuCGbg0P6JbSXSY" //"REPLACE_WITH_YOUR_FIREBASE_PROJECT_API_KEY"

#define pinRebootAP 14

#define DEBUG 1

#ifdef DEBUG
#define debug(x) Serial.print(x)
#define debugln(x) Serial.println(x)
#define debugf(x) Serial.printf(x)
#else
#define debug(x)
#define debugln(x)
#define debugf(x)
#endif

const char *ssid = "BatteryMagic-AP"; // Set the SSID (network name) of the access point

IPAddress staticIP(192, 168, 0, 1); // Set your desired static IP address
IPAddress gateway(192, 168, 0, 1);  // Set your network gateway address
IPAddress subnet(255, 255, 255, 0); // Set your network subnet mask

AsyncWebServer serverAP(80); // Create a web server on port 80

// Define Firebase objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Variable to save USER UID
String uid;

static const char html[] PROGMEM = R"rawliteral(
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ESP32 AP Setup</title>
</head>
<body style="background-color: rgb(236, 236, 236);">
    <style>
        input {
            height: 2em;
            width: auto;
            border-radius: 0.5em;
            margin-top: 0.1em;
        }

        input:focus {
            height: 2.5em;
            border-color: crimson;
            border-width: 0.2em;
        }
    </style>
    <div
        style="background-color: rgb(215, 227, 255); border:0.25em rgb(0, 24, 109) solid; border-radius: 3em; margin: 2em;">
        <div style="justify-content:center; display:flex; margin: 2em">
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
                <input type="password" name="email-password" id="email-password" placeholder="Firebase-Password"
                    required><br>
                <input type="checkbox" name="saveFirebase" id="saveFirebase">
                <label for="saveFirebase">Save Firebase credentials</label><br>
                <br>
                <input type='submit' value='Connect' style="margin-bottom: 1em;">
            </form>
        </div>
    </div>
</body>
</ html>)rawliteral";

static const char html_connected[] PROGMEM = R"rawliteral(
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body onload="window.close();">
WiFi is set up. You can now close this window and disconnect from the Access Point.
</body>
</html>
)rawliteral";

void handleRoot(AsyncWebServerRequest *request)
{
  request->send(200, "text/html", html); // Serve the HTML page
}

void handleConnect(AsyncWebServerRequest *request)
{
  String ssid = request->arg("ssid");         // Read the SSID from the form data
  String password = request->arg("password"); // Read the password from the form data
  String saveWiFi = request->arg("saveWiFi");

  String email_name = request->arg("email-name");
  String email_password = request->arg("email-password");
  String saveFirebase = request->arg("saveFirebase");

  request->send(200, "text/html", html_connected); // Send a response to the browser
  serverAP.end();

  debugln();
  debugln("stopped Server AP");

  DynamicJsonDocument doc(1024);
  File filer = SPIFFS.open("/NetworkConfig.txt", "r");
  deserializeJson(doc, filer);
  filer.close();

  debugln("---------------------------------------------------------------");
  debugln(ssid);
  debugln(password);
  if (saveWiFi == "on")
  {
    debugln("save WiFi is on");
    doc["Config-WiFi"][0] = ssid;
    doc["Config-WiFi"][1] = password;
    doc["isConfigured"] = true;
  }
  else
  {
    debugln("save WiFi is off");
    doc["Config-WiFi"][0] = NULL;
    doc["Config-WiFi"][1] = NULL;
    doc["isConfigured"] = false;
  }
  debugln();

  debugln(email_name);
  debugln(email_password);
  if (saveFirebase == "on")
  {
    debugln("save Firebase is on");
    doc["Config-Firebase"][0] = email_name;
    doc["Config-Firebase"][1] = email_password;
  }
  else
  {
    debugln("save Firebase is off");
    doc["Config-Firebase"][0] = NULL;
    doc["Config-Firebase"][1] = NULL;
  }
  debugln("----------------------------------------------------------------");

  if (DEBUG)
  {
    serializeJsonPretty(doc, Serial);
  }

  File filew = SPIFFS.open("/NetworkConfig.txt", "w");
  serializeJsonPretty(doc, filew); // write the Json Data to the FS
  filew.close();
  esp_restart(); // reboot the esp32 uC
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void setup()
{
  Serial.begin(115200);
  pinMode(pinRebootAP, INPUT_PULLDOWN);

  if (!SPIFFS.begin())
  {
    debugln("An Error has occurred while mounting SPIFFS");
    return;
  }

  DynamicJsonDocument doc(1024);
  File file = SPIFFS.open("/NetworkConfig.txt", "r");
  deserializeJson(doc, file);
  if (digitalRead(pinRebootAP))
  {
    doc["isConfigured"] = false;
  }
  if (DEBUG)
  {
    serializeJsonPretty(doc, Serial);
  }
  file.close();

  if (doc["isConfigured"] == true)
  {
    WiFi.mode(WIFI_STA);
    const char *ssid = doc["Config-WiFi"][0];
    const char *password = doc["Config-WiFi"][1];
    debugln();
    debugln(ssid);
    debugln(password);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED)
    {
      debug(".");
      delay(2000);
    }
    debugln(WiFi.localIP());

    // Assign the api key (required)
    config.api_key = API_KEY;

    // Assign the user sign in credentials
    // auth.user.email = "email";
    // auth.user.password = "password";
    const char *userEmail = doc["Config-Firebase"][0];
    debugln(userEmail);
    // auth.user.email = userEmail;
    const char *userPassword = doc["Config-Firebase"][1];
    debugln(userPassword);
    // auth.user.email = userPassword;

    // Initialize the library with the Firebase authen and config
    Firebase.begin(API_KEY);

    // Authenticate with Firebase using email and password
    if (auth.signInWithEmailAndPassword(userEmail, userPassword))
    {
      Serial.println("Authenticated with Firebase");
    }
    else
    {
      Serial.println("Failed to authenticate with Firebase");
      return;
    }

    // Assign the callback function for the long running token generation task
    config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h

    // Assign the maximum retry of token generation
    config.max_token_generation_retry = 5;

    // Getting the user UID might take a few seconds
    Serial.println("Getting User UID");
    while ((auth.token.uid) == "")
    {
      Serial.print('.');
      delay(1000);
    }
    // Print user UID
    uid = auth.token.uid.c_str();
    Serial.print("User UID: ");
    Serial.print(uid);
  }
  else
  {
    WiFi.mode(WIFI_AP);
    WiFi.softAP(ssid);                            // Create the access point
    WiFi.softAPConfig(staticIP, gateway, subnet); // Set the static IP configuration

    debugln("Access point created");

    debug("\nIP address: "); // Print the IP address of the access point
    debugln(WiFi.softAPIP().toString());
    serverAP.on("/", HTTP_GET, handleRoot);            // Handle GET requests to the root URL
    serverAP.on("/connect", HTTP_POST, handleConnect); // Handle POST requests to the "/connect" URL
    serverAP.begin();                                  // Start the web serverAP
  }
}

void loop()
{
  if (Firebase.isTokenExpired())
  {
    Firebase.refreshToken(&config);
    Serial.println("Refresh token");
  }
}