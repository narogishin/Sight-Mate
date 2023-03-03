#include <WiFi.h>

const char* ssid     = "network's name";
const char* password = "password";

const char* host = "server's ip adress, in out case we have python code";

#define BUTTON_PIN 14 // GIOP14 pin connected to button
#define BUTTON_PIN_2 25 // GIOP25 pin connected to button

// Variables will change:
int lastState = HIGH; // the previous state from the input pin
int lastState_2 = HIGH; // the previous state from the input pin
int currentState;     // the current reading from the input pin
int currentState_2;     // the current reading from the input pin
int PORT = 12345;     // defining the port number

void setup() {
  Serial.begin(115200);
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(BUTTON_PIN_2, INPUT_PULLUP);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print("...");
    }
}

void loop() {
  currentState = digitalRead(BUTTON_PIN);
  currentState_2 = digitalRead(BUTTON_PIN_2);

    Serial.println("Connected to server successful!");
    Serial.println(currentState);
    Serial.println(currentState_2);


  if(lastState == LOW && currentState == HIGH){
    WiFiClient client;
    const int httpPort = PORT;
    if (!client.connect(host, httpPort)) {
        Serial.println("connection failed");
        return;
    }
    client.print("1");
    Serial.println("The state changed from LOW to HIGH");}
    if(lastState_2 == LOW && currentState_2 == HIGH){
    WiFiClient client;
    const int httpPort = PORT;
    if (!client.connect(host, httpPort)) {
        Serial.println("connection failed");
        return;
    }
    client.print("2");
    Serial.println("The state changed from LOW to HIGH");}

  lastState = currentState;
  lastState_2 = currentState_2;

  delay(250);
}
