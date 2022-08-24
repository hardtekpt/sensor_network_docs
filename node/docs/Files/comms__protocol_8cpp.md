---
title: comms_protocol.cpp
summary: Communication Protocol library - set of functions and data structures used to build a network using the LoRa modulation radios. 

---

# comms_protocol.cpp

Communication Protocol library - set of functions and data structures used to build a network using the LoRa modulation radios.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| cppQueue | **[msg_q](/Node/Files/comms__protocol_8cpp/#function-msg-q)**(sizeof([Msg](/Node/Files/comms__protocol_8h/#typedef-msg)) , [MAX_QUEUE_SIZE](/Node/Files/comms__protocol_8h/#define-max-queue-size) , [IMPLEMENTATION](/Node/Files/comms__protocol_8h/#define-implementation) ) |
| void | **[LoRa_rxMode](/Node/Files/comms__protocol_8cpp/#function-lora-rxmode)**()<br>Sets the LoRa radio to receive mode.  |
| void | **[LoRa_txMode](/Node/Files/comms__protocol_8cpp/#function-lora-txmode)**()<br>Sets the LoRa radio to transmit mode.  |
| void | **[LoRa_sendMessage](/Node/Files/comms__protocol_8cpp/#function-lora-sendmessage)**(byte * message)<br>Sets the radio to transmit mode, sends a message string using the LoRa radio and sets the radio back to receive mode.  |
| byte * | **[splitAndEncrypt2](/Node/Files/comms__protocol_8cpp/#function-splitandencrypt2)**(char msg[MAX_PAYLOAD_SIZE])<br>Encrypts a message (character array) using the AES256 algorythm with the corresponding node key The encryption is made by encrypting blocks of 16 bytes and joining them together.  |
| char * | **[decryptMsg2](/Node/Files/comms__protocol_8cpp/#function-decryptmsg2)**(char msg[MAX_PAYLOAD_SIZE+1])<br>Decrypts a message string using the AES256 algorythm with the corresponding node key.  |
| int | **[mymin](/Node/Files/comms__protocol_8cpp/#function-mymin)**(int a, int b)<br>returns the minimum value between two integers  |
| void | **[sendAck](/Node/Files/comms__protocol_8cpp/#function-sendack)**(byte msgID)<br>Send an acknowledge message confirming the reception of an uplink transmission.  |
| void | **[sendStatus](/Node/Files/comms__protocol_8cpp/#function-sendstatus)**(byte msgID)<br>Send an uplink message containing the node status.  |
| void | **[setActState](/Node/Files/comms__protocol_8cpp/#function-setactstate)**(int ID, int val)<br>Sets the state of the relevant actuator with the relevant value.  |
| void | **[sendSensorData](/Node/Files/comms__protocol_8cpp/#function-sendsensordata)**(byte sensorID, byte sensorVal)<br>Adds to the message queue an uplink message containing sensor data.  |
| void | **[getMsgFromQueueAndSend](/Node/Files/comms__protocol_8cpp/#function-getmsgfromqueueandsend)**(unsigned long currentMillis)<br>Get a message from the send queue and send it. Implements retransmission in case an acknowledge message is not received. Aware of a failed transmission.  |
| void | **[onReceive](/Node/Files/comms__protocol_8cpp/#function-onreceive)**(int packetSize)<br>Called every time a new message is received. Filters unwanted messages, decrypts the payload, gets the relevant fields from the payload and sends back an acknowledge message if necessary.  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| int | **[currMsg](/Node/Files/comms__protocol_8cpp/#variable-currmsg)**  |
| int | **[count](/Node/Files/comms__protocol_8cpp/#variable-count)**  |
| unsigned long | **[prevMil](/Node/Files/comms__protocol_8cpp/#variable-prevmil)**  |
| unsigned long | **[prevMilSU](/Node/Files/comms__protocol_8cpp/#variable-prevmilsu)**  |
| float | **[VBAT](/Node/Files/comms__protocol_8cpp/#variable-vbat)**  |
| int | **[msgCount](/Node/Files/comms__protocol_8cpp/#variable-msgcount)**  |
| aes256_context | **[ctxt](/Node/Files/comms__protocol_8cpp/#variable-ctxt)**  |

## Detailed Description

Communication Protocol library - set of functions and data structures used to build a network using the LoRa modulation radios. 

**Author**: Francisco Santos ([francisco.velez@tecnico.ulisboa.pt](mailto:francisco.velez@tecnico.ulisboa.pt)) 

**Version**: 1.0 

**Date**: 2022-08-10

**Copyright**: Copyright (c) 2022 

## Functions Documentation

### function msg_q

```cpp
cppQueue msg_q(
    sizeof(Msg) ,
    MAX_QUEUE_SIZE ,
    IMPLEMENTATION 
)
```


### function LoRa_rxMode

```cpp
void LoRa_rxMode()
```

Sets the LoRa radio to receive mode. 

**Return**: void 

### function LoRa_txMode

```cpp
void LoRa_txMode()
```

Sets the LoRa radio to transmit mode. 

**Return**: void 

### function LoRa_sendMessage

```cpp
void LoRa_sendMessage(
    byte * message
)
```

Sets the radio to transmit mode, sends a message string using the LoRa radio and sets the radio back to receive mode. 

**Parameters**: 

  * **message** message to send 


**Return**: void 

### function splitAndEncrypt2

```cpp
byte * splitAndEncrypt2(
    char msg[MAX_PAYLOAD_SIZE]
)
```

Encrypts a message (character array) using the AES256 algorythm with the corresponding node key The encryption is made by encrypting blocks of 16 bytes and joining them together. 

**Parameters**: 

  * **msg** message array to be decrypted 


**Return**: byte* a byte array containing the encrypted message 

### function decryptMsg2

```cpp
char * decryptMsg2(
    char msg[MAX_PAYLOAD_SIZE+1]
)
```

Decrypts a message string using the AES256 algorythm with the corresponding node key. 

**Parameters**: 

  * **msg** message string to be decrypted 


**Return**: char* an array of characters containing the decrypted message 

### function mymin

```cpp
int mymin(
    int a,
    int b
)
```

returns the minimum value between two integers 

**Parameters**: 

  * **a** first integer to compare 
  * **b** second integer to compare 


**Return**: int the smaller between a and b 

### function sendAck

```cpp
void sendAck(
    byte msgID
)
```

Send an acknowledge message confirming the reception of an uplink transmission. 

**Parameters**: 

  * **msgID** ID of the message being acknowledged 


**Return**: void 

### function sendStatus

```cpp
void sendStatus(
    byte msgID
)
```

Send an uplink message containing the node status. 

**Parameters**: 

  * **msgID** ID of the status request message 


**Return**: void 

### function setActState

```cpp
void setActState(
    int ID,
    int val
)
```

Sets the state of the relevant actuator with the relevant value. 

**Parameters**: 

  * **ID** ID of the relevant actuator 
  * **val** value to which the actuator is set to 


**Return**: void 

### function sendSensorData

```cpp
void sendSensorData(
    byte sensorID,
    byte sensorVal
)
```

Adds to the message queue an uplink message containing sensor data. 

**Parameters**: 

  * **sensorID** ID of the relevant sensor 
  * **sensorVal** value read from the relevant sensor 


**Return**: void 

Note: The ADC value is a 12-bit number, so the maximum value is 4095 (counting from 0). To convert the ADC integer value to a real voltage you’ll need to divide it by the maximum value of 4095, then double it (note above that Adafruit halves the voltage), then multiply that by the reference voltage of the ESP32 which is 3.3V and then vinally, multiply that again by the ADC Reference Voltage of 1100mV.


### function getMsgFromQueueAndSend

```cpp
void getMsgFromQueueAndSend(
    unsigned long currentMillis
)
```

Get a message from the send queue and send it. Implements retransmission in case an acknowledge message is not received. Aware of a failed transmission. 

**Parameters**: 

  * **currentMillis** current time in millisenconds since boot 


**Return**: void 

### function onReceive

```cpp
void onReceive(
    int packetSize
)
```

Called every time a new message is received. Filters unwanted messages, decrypts the payload, gets the relevant fields from the payload and sends back an acknowledge message if necessary. 

**Parameters**: 

  * **packetSize** size of the incoming message in bytes 


**Return**: void 


## Attributes Documentation

### variable currMsg

```cpp
int currMsg = -1;
```


### variable count

```cpp
int count = 0;
```


### variable prevMil

```cpp
unsigned long prevMil;
```


### variable prevMilSU

```cpp
unsigned long prevMilSU;
```


### variable VBAT

```cpp
float VBAT = 1.0;
```


### variable msgCount

```cpp
int msgCount = 0;
```


### variable ctxt

```cpp
aes256_context ctxt;
```



## Source code

```cpp

#include "comms_protocol.h"

int currMsg = -1;
int count = 0;
unsigned long prevMil;
unsigned long prevMilSU;
float VBAT = 1.0;
int msgCount = 0;

cppQueue  msg_q(sizeof(Msg), MAX_QUEUE_SIZE, IMPLEMENTATION);
aes256_context ctxt;

void LoRa_rxMode() {
  LoRa.enableInvertIQ();
  LoRa.receive();
}

void LoRa_txMode() {
  LoRa.idle();
  LoRa.disableInvertIQ();
}

void LoRa_sendMessage(byte *message) {
  LoRa_txMode();                        // set tx mode
  LoRa.beginPacket();                   // start packet
  LoRa.write(netID);
  LoRa.write(nodeID);
  //LoRa.print(message);                  // add payload
  LoRa.write(message, MAX_ENC_PAYLOAD_SIZE);
  LoRa.endPacket(false);                 // finish packet and send it
  LoRa_rxMode();
}


/*String splitAndEncrypt(char msg[MAX_PAYLOAD_SIZE]) {
  String enc = "";
  aes256_init(&ctxt,(uint8_t *) key);
  const char * p = msg;

  while (strlen (p) > 0) {
    byte plain [BLOCK_SIZE];
    memset (plain, 0, BLOCK_SIZE);  // ensure trailing zeros
    memcpy (plain, p, mymin (strlen (p), BLOCK_SIZE));

    aes256_encrypt_ecb(&ctxt, plain);
    enc += String((char *)plain);
    p += mymin (strlen (p), BLOCK_SIZE);
  }
  aes256_done(&ctxt);
  return enc;
}*/

byte *splitAndEncrypt2(char msg[MAX_PAYLOAD_SIZE]) {
  String enc = "";
  aes256_init(&ctxt,(uint8_t *) key);
  const char * p = msg;
  static byte plain [BLOCK_SIZE];
  while (strlen (p) > 0) {
    
    memset (plain, 0, BLOCK_SIZE);  // ensure trailing zeros
    memcpy (plain, p, mymin (strlen (p), BLOCK_SIZE));

    aes256_encrypt_ecb(&ctxt, plain);
    return plain;
    enc += String((char *)plain);
    p += mymin (strlen (p), BLOCK_SIZE);
  }
  aes256_done(&ctxt);
}

/*
 * Function: decryptMsg
 * ----------------------------
 *   Decrypts a message string using the AES256 algorythm with the corresponding node key
 *   
 *   msg: message string to be decrypted
 *
 *   returns: an array of characters containing the decrypted message
 
char  *decryptMsg(String msg) {
  static uint8_t data[MAX_PAYLOAD_SIZE+1];
  static char m[MAX_PAYLOAD_SIZE+1];
  msg.toCharArray(m, MAX_PAYLOAD_SIZE+1);
  aes256_decrypt_ecb(&ctxt, (uint8_t *)m);
  return (char *)m;
}*/

char  *decryptMsg2(char msg[MAX_PAYLOAD_SIZE+1]) {
  static uint8_t data[MAX_PAYLOAD_SIZE+1];
  memcpy(data, msg, MAX_PAYLOAD_SIZE+1);
  //static char m[MAX_PAYLOAD_SIZE+1];
  //msg.toCharArray(m, MAX_PAYLOAD_SIZE+1);
  aes256_decrypt_ecb(&ctxt, (uint8_t *)data);
  return (char *)data;
}


int mymin(int a, int b){
  if (a>b)
    return b;
  return a;
}



void sendAck(byte msgID) {
  String enc;
  char payload[MAX_PAYLOAD_SIZE];
  char encP[MAX_ENC_PAYLOAD_SIZE];
  byte l = (byte)MAX_PAYLOAD_SIZE;
  Msg msg;

  #if defined(ESP32)
    VBAT = (float)(analogRead(vbatPin)) / 4095*2*3.3*1.1;
  #endif
  int a = VBAT;
  int b = VBAT*10-a*10;
  sprintf(payload, "%c%c%c%c%c%c%c%c", (char)nodeID, (char)msgID, (char)l, 'a', (char)48, (char)48, (char)a+1, (char)b+1);

  //enc = splitAndEncrypt(payload);
  //enc.toCharArray(msg.msg, MAX_ENC_PAYLOAD_SIZE);
  byte *plain = splitAndEncrypt2(payload);
  memcpy(msg.msg, plain, MAX_PAYLOAD_SIZE);
  msg.msg[MAX_PAYLOAD_SIZE] = '\0';

  Serial.print("add ack to queue: ");
  Serial.println(payload);
  //Serial.print("enc msg: ");
  //Serial.println(msg.msg);

  msg.msgID = msgID;
  msg.flag = 'a';  
  msg_q.push(&msg);
}


void sendStatus(byte msgID) {
  Msg msg;
  String enc;
  char payload[MAX_PAYLOAD_SIZE];
  msg.msgID = msgID;
  byte l = (byte) MAX_PAYLOAD_SIZE;

  #if defined(ESP32)
    VBAT = (float)(analogRead(vbatPin)) / 4095*2*3.3*1.1;
  #endif
  int a = VBAT;
  int b = VBAT*10-a*10;
  sprintf(payload, "%c%c%c%c%c%c%c%c", (char)nodeID, (char)msgID, (char)l, 's', (char)48, (char)48, (char)a+1, (char)b+1);
 
  //enc = splitAndEncrypt(payload);
  //enc.toCharArray(msg.msg, MAX_ENC_PAYLOAD_SIZE);
  byte *plain = splitAndEncrypt2(payload);
  memcpy(msg.msg, plain, MAX_PAYLOAD_SIZE);
  msg.msg[MAX_PAYLOAD_SIZE] = '\0';
  
  Serial.print("add status to queue: ");
  Serial.println(payload);
  //Serial.print("enc msg: ");
  //Serial.println(msg.msg);

  // Add msg to msg queue
  msg.flag = 's';
  msg_q.push(&msg);
}

void setActState(int ID, int val) {
  Serial.print("Set actuator: ");
  Serial.print(ID);
  Serial.print(" with value: ");
  Serial.println(val);
  digitalWrite(actPin[ID], val);
}

void sendSensorData(byte sensorID, byte sensorVal) {
  Msg msg;
  String enc;
  char payload[MAX_PAYLOAD_SIZE];
  msgCount ++;
  if (msgCount == 0)
    msgCount ++;
  msg.msgID = (byte) msgCount;
  byte l = MAX_PAYLOAD_SIZE;

  #if defined(ESP32)
    VBAT = (float)(analogRead(vbatPin)) / 4095*2*3.3*1.1;
  #endif
  Serial.println(VBAT);
  int a = VBAT;
  int b = VBAT*10-a*10;
  sprintf(payload, "%c%c%c%c%c%c%c%c", (char)nodeID, (char)msg.msgID, (char)l, 'u', (char)(sensorID + 1), (char)(sensorVal + 1), (char)a+1, (char)b+1);

  //enc = splitAndEncrypt(payload);
  //enc.toCharArray(msg.msg, MAX_ENC_PAYLOAD_SIZE);
  byte *plain = splitAndEncrypt2(payload);
  memcpy(msg.msg, plain, MAX_PAYLOAD_SIZE);
  msg.msg[MAX_PAYLOAD_SIZE] = '\0';

  // Add msg to msg queue
  msg.flag = 'u';
  msg_q.push(&msg);
}

void getMsgFromQueueAndSend(unsigned long currentMillis) {
  if (!msg_q.isEmpty()) {
    Msg msg;
    msg_q.peek(&msg);

    if (currMsg == msg.msgID)
      count ++;
    else
      count = 0;

    currMsg = msg.msgID;
    if (count < MAX_N_RETRY) {
      Serial.print("send msg: ");
      //Serial.println(msg.msg);
      LoRa_sendMessage(msg.msg);
      if ((msg.flag == 's') || (msg.flag == 'a')){
        msg_q.drop();
        currMsg = -1;
      }
    } else {
      Serial.print("Failed to send msg with id: ");
      Serial.println(msg.msgID);
      msg_q.drop();
      currMsg = -1;
    }
    prevMil = currentMillis;
  }
}

void onReceive(int packetSize){
  byte rNetID = LoRa.read();
  byte rnID = LoRa.read();
  char buffer1[MAX_ENC_PAYLOAD_SIZE];
  char buffer2[MAX_ENC_PAYLOAD_SIZE];
  String message = "";
  int i=0;
  while (LoRa.available() && i<MAX_ENC_PAYLOAD_SIZE) {
    //Serial.println(LoRa.peek(), HEX);
    buffer1[i] = (char)LoRa.read();
    //message += (char)LoRa.read();
    
    i++;
  }
  Serial.println("msg");
  //Serial.println(message.length());
  //Serial.println(MAX_ENC_PAYLOAD_SIZE);
  //Serial.println(rNetID == netID);
  if (rNetID == netID) {
    Serial.println("New msg received");
    

    //int j = message.length() / ENC_BLOCK_SIZE;
    //int h = message.length() / (1 * j);
    
    byte len;
    Payload p;

    if (rnID == BROADCAST_ID)
      aes256_init(&ctxt,(uint8_t *) keyBroadcast);
    else
      aes256_init(&ctxt,(uint8_t *) key);
    //for (int i = 0; i < j; i++) {
    //  if (i == 0)
    //    strcpy(buffer1, decryptMsg(message.substring(i * ENC_BLOCK_SIZE, (i + 1) * ENC_BLOCK_SIZE)));
    //  else
    //    strcat(buffer1, decryptMsg(message.substring(i * ENC_BLOCK_SIZE, (i + 1) * ENC_BLOCK_SIZE)));
    //}
    strcpy(buffer2, decryptMsg2(buffer1));
    aes256_done(&ctxt);

    buffer2[6] = '\0';

    Serial.println(buffer2);
    if(sscanf(buffer2, "%c%c%c%c%c%c", &p.nodeID, &p.msgID, &len, &p.flag, &p.sensorID, &p.sensorVal) == 6){
      Serial.println(p.flag);
      Msg msg;
      msg_q.peek(&msg);
      if (p.nodeID == nodeID || p.nodeID == BROADCAST_ID) {
        if (p.flag == 'a') {
          if (p.msgID == msg.msgID) {
            Serial.print("Message with ID: ");
            Serial.print(p.msgID);
            Serial.println(" delivered!");
            msg_q.drop();
          }
        } else if (p.flag == 's') {
          Serial.print("received msg with id: ");
          Serial.println(p.msgID);
          sendStatus(p.msgID);
        } else if (p.flag == 'c') {
          // Set actuator value and send ack
          setActState((int)(p.sensorID - 1), (int)(p.sensorVal - 1));
          sendAck(p.msgID);
        }
      }
    }  
  }
}
```


-------------------------------

Updated on 2022-08-24 at 10:39:39 +0000
