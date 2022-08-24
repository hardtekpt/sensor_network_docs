---
title: node.ino
summary: Node script - send sensor data to gateway and receive commands from gateway. 

---

# node.ino

Node script - send sensor data to gateway and receive commands from gateway.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| void | **[setup](/Node/Files/node_8ino/#function-setup)**()<br>Arduino setup function.  |
| void | **[loop](/Node/Files/node_8ino/#function-loop)**()<br>Arduino loop function.  |

## Detailed Description

Node script - send sensor data to gateway and receive commands from gateway. 

**Author**: Francisco Santos ([francisco.velez@tecnico.ulisboa.pt](mailto:francisco.velez@tecnico.ulisboa.pt)) 

**Version**: 1.0 

**Date**: 2022-08-09

**Copyright**: Copyright (c) 2022 

## Functions Documentation

### function setup

```cpp
void setup()
```

Arduino setup function. 


## Function: setup

Runs once at boot. Configure the serial communication. Configure the LoRa radio. Configure the sensors and actuators input mode

void 


### function loop

```cpp
void loop()
```

Arduino loop function. 


## Function: loop

Main loop function. checks for incoming uplink messages and downlink requests from the server. calls getMsgFromQueueAndSend on fixed schedules to avoid congestion of the communication channel and sends an uplink message with the node status periodically.

void 




## Source code

```cpp

#include "comms_protocol.h"


void setup() {
  for(int i=0; i<sensN; i++){
    pinMode(sensPin[i], INPUT); 
  }
  for(int i=0; i<actN; i++){
    pinMode(actPin[i], OUTPUT); 
  }
  Serial.begin(BAUD_RATE);

  #if defined(ESP32)
    SPI.begin(SCK, MISO, MOSI, SS);
  #endif
  //LoRa.setTxPower(txPower);
  
  //LoRa.setSignalBandwidth(signalBandwidth);
  //LoRa.setCodingRate4(codingRateDenominator);
  LoRa.setPins(SS, RST, DIO0);
  
  if (!LoRa.begin(frequency)) {
    Serial.println("LoRa init failed.");
    while (true);
  }

  LoRa.setSpreadingFactor(7);
  LoRa.setCodingRate4(8);

  LoRa.setSyncWord(netID);
  LoRa.enableCrc();
  LoRa_rxMode();

  prevMil = millis();
  prevMilSU = millis();
  
  Serial.println("Node startup complete");
  sendSensorData(0, 3);
}


void loop() {
  unsigned long currentMillis = millis();

  // Receive Downlink msg
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    onReceive(packetSize);
  }

  // Send Uplink msg
  if((currentMillis-prevMil) > TIMEOUT_INTERVAL){
    getMsgFromQueueAndSend(currentMillis);
  }

  // Send node status
  if((currentMillis-prevMilSU) > STATUS_UPDATE_INTERVAL){
    byte msgID = random(MAX_MSG_ID);
    //sendStatus(msgID);
    prevMilSU = currentMillis;
  }
}
```


-------------------------------

Updated on 2022-08-24 at 10:39:39 +0000
