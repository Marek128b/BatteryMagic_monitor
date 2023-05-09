#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>
#include <SPIFFS.h>
#include <ArduinoJson.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include "time.h"

// Provide the token generation process info.
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

unsigned long lastInterval = 0;
unsigned long interval = 5000;

unsigned long interator = 0;

#define pinRebootAP 14

// #define DEBUG

#ifdef DEBUG
#define debug(x) Serial.print(x)
#define debugln(x) Serial.println(x)
#else
#define debug(x)
#define debugln(x)
#endif

// Insert Firebase project API Key
#define API_KEY "AIzaSyBHIc9XTrsoHxUlgKc1kuCGbg0P6JbSXSY"
#define DATABASE_URL "magicbattery-1abba-default-rtdb.europe-west1.firebasedatabase.app" //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app

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

int timestamp;
FirebaseJson json;

const char *ntpServer = "pool.ntp.org";

static const char html[] PROGMEM = R"rawliteral(
<html>
<head>
    <title>ESP32 form test</title>
</head>

<body>
    <style>
        html {
            height: 100%;
            background: linear-gradient(#141e30, #243b55);
            margin: 0;
            padding: 0;
        }

        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.5);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.6);
            border-radius: 10px;
        }

        .login-box h2 {
            margin: 0 0 30px;
            color: white;
            text-align: center;
        }

        .login-box .user-box {
            position: relative;
        }

        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 2px solid #adadad;
            outline: none;
            background: transparent;
        }

        .login-box form .submit {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            background-color: #03e9f4;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            margin-top: 40px;
            border: 2px #03e9f4 solid;
        }
    </style>
    <div class="login-box">
        <h2>Login WiFi</h2>
        <form method='post' action='/connect'>
            <div class="user-box">
                <input type='text' id='ssid' name='ssid' placeholder="WiFi SSID" required><br>
                <input type='password' id='password' name='password' placeholder="WiFi-Password" required><br>
                <div style="display: block;">
                    <input type="checkbox" name="saveWiFi" id="saveWiFi" style="display: inline-block">
                    <label for="saveWiFi" style="color: #fff; display: inline-block;">Save WiFi SSID and
                        Password</label>
                </div>

                <h2 style="margin-top: 3em;">Login Firebase</h2>
                <input type="email" name="email-name" id="email-name" placeholder="Firebase-Email" required><br>
                <input type="password" name="email-password" id="email-password" placeholder="Firebase-Password"
                    required><br>
                <div style="display: block;">
                    <input type="checkbox" name="saveFirebase" id="saveFirebase" style="display: inline-block">
                    <label for="saveFirebase" style="color: #fff; display: inline-block;">Save Firebase
                        credentials</label>
                </div>
                <br>
            </div>
            <input class="submit" type='submit' value='Connect'>
        </form>
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

#ifdef DEBUG
  serializeJsonPretty(doc, Serial);
#endif

  File filew = SPIFFS.open("/NetworkConfig.txt", "w");
  serializeJsonPretty(doc, filew); // write the Json Data to the FS
  filew.close();
  esp_restart(); // reboot the esp32 uC
}

// Function that gets current epoch time
unsigned long getTime()
{
  time_t now;
  struct tm timeinfo;
  if (!getLocalTime(&timeinfo))
  {
    debugln("Failed to obtain time");
    return (0);
  }
  time(&now);
  return now;
}

void writeRTDB()
{
  // Get current timestamp
  timestamp = getTime();
  debug("\ntime: ");
  debugln(timestamp);

  json.set("/timestamp", String(timestamp));
  json.set("/type", String("6s"));
  json.set("/voltages/0", "1s");
  json.set("/voltages/1", "2s");
  json.set("/voltages/2", "3s");
  json.set("/voltages/3", "4s");
  json.set("/voltages/4", "5s");
  json.set("/voltages/5", "6s");
  json.set("/error", String("NULL"));

  char dbPath[256];
  snprintf(dbPath, sizeof(dbPath), "Users/%s/%s/data/%d", uid.c_str(), "BatteryName", interator);
  debugln(dbPath);

  debug("Set Json... ");
  if (Firebase.RTDB.setJSON(&fbdo, dbPath, &json))
  {
    debug("ok");
  }
  else
  {
    debug(fbdo.errorReason().c_str());
  }
}

void readRTDB()
{
  char dbPath[256];
  snprintf(dbPath, sizeof(dbPath), "Users/%s/%s/startCharging", uid.c_str(), "BatteryName");
  debugln(dbPath);

  debug("get string... ");
  if (Firebase.RTDB.getString(&fbdo, dbPath))
  {
    debug(fbdo.to<const char *>());
  }
  else
  {
    debug(fbdo.errorReason().c_str());
  }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void setup()
{
  Serial.begin(115200);
  pinMode(pinRebootAP, INPUT_PULLDOWN);
  configTime(0, 0, ntpServer);

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
#ifdef DEBUG
  serializeJsonPretty(doc, Serial);
#endif
  file.close();

  if (doc["isConfigured"] == true)
  {
    WiFi.mode(WIFI_STA);
    const char *ssid = doc["Config-WiFi"][0];
    const char *password = doc["Config-WiFi"][1];
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
    auth.user.email = "georg.marek687@gmail.com";
    auth.user.password = "Arduino";

    Firebase.reconnectWiFi(true);
    fbdo.setResponseSize(4096);

    /* Assign the RTDB URL (required) */
    config.database_url = DATABASE_URL;

    // Assign the callback function for the long running token generation task
    config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h
    // Assign the maximum retry of token generation
    config.max_token_generation_retry = 5;
    // Initialize the library with the Firebase authen and config
    Firebase.begin(&config, &auth);

    // Getting the user UID might take a few seconds
    debugln("Getting User UID");
    while ((auth.token.uid) == "")
    {
      debug('.');
      delay(1000);
    }
    // Print user UID
    uid = auth.token.uid.c_str();
    debug("User UID: ");
    debug(uid);
  }
  else
  {
    WiFi.mode(WIFI_AP);
    WiFi.softAP(ssid);                            // Create the access point
    WiFi.softAPConfig(staticIP, gateway, subnet); // Set the static IP configuration

    debugln("Access point created");
    // debugln("IP address: " + WiFi.softAPIP().toString()); // Print the IP address of the access point
    serverAP.on("/", HTTP_GET, handleRoot);            // Handle GET requests to the root URL
    serverAP.on("/connect", HTTP_POST, handleConnect); // Handle POST requests to the "/connect" URL
    serverAP.begin();                                  // Start the web serverAP
  }
  if (Firebase.ready())
  {
    char dbPath[256];
    snprintf(dbPath, sizeof(dbPath), "Users/%s/%s/data/", uid.c_str(), "BatteryName");
    debugln(dbPath);

    debug("Delete data... ");
    if (Firebase.RTDB.deleteNode(&fbdo, dbPath))
    {
      debug("ok");
    }
    else
    {
      debug(fbdo.errorReason().c_str());
    }
  }

  lastInterval = millis() + interval;
}

void loop()
{
  if (Firebase.ready() && (millis() - lastInterval >= interval))
  {
    readRTDB();
    // readADC();
    writeRTDB();
    interator++;
    lastInterval = millis();
  }

  if (Firebase.isTokenExpired())
  {
    Firebase.refreshToken(&config);
    debugln("Refresh token");
  }
}