---
title: comms_protocol.h
summary: Header file for the communication protocol library. Contains the used data structures, function declaration and general configuartion options for the library. 

---

# comms_protocol.h

Header file for the communication protocol library. Contains the used data structures, function declaration and general configuartion options for the library.  [More...](#detailed-description)

## Classes

|                | Name           |
| -------------- | -------------- |
| struct | **[strPayload](/Gateway/Classes/structstr_payload/)**  |
| struct | **[strMsg](/Gateway/Classes/structstr_msg/)**  |

## Types

|                | Name           |
| -------------- | -------------- |
| typedef struct [strPayload](/Gateway/Classes/structstr_payload/) | **[Payload](/Gateway/Files/comms__protocol_8h/#typedef-payload)**  |
| typedef struct [strMsg](/Gateway/Classes/structstr_msg/) | **[Msg](/Gateway/Files/comms__protocol_8h/#typedef-msg)**  |

## Functions

|                | Name           |
| -------------- | -------------- |
| void | **[LoRa_rxMode](/Gateway/Files/comms__protocol_8h/#function-lora-rxmode)**()<br>Sets the LoRa radio to receive mode.  |
| void | **[LoRa_txMode](/Gateway/Files/comms__protocol_8h/#function-lora-txmode)**()<br>Sets the LoRa radio to transmit mode.  |
| void | **[LoRa_sendMessage](/Gateway/Files/comms__protocol_8h/#function-lora-sendmessage)**(byte * message)<br>Sets the radio to transmit mode, sends a message string using the LoRa radio and sets the radio back to receive mode.  |
| char * | **[decryptMsg](/Gateway/Files/comms__protocol_8h/#function-decryptmsg)**(String msg) |
| char * | **[decryptMsg2](/Gateway/Files/comms__protocol_8h/#function-decryptmsg2)**(char msg[MAX_PAYLOAD_SIZE+1])<br>Decrypts a message string using the AES256 algorythm with the corresponding node key.  |
| void | **[onReceive](/Gateway/Files/comms__protocol_8h/#function-onreceive)**(int packetSize)<br>Called every time a new message is received. Filters unwanted messages, decrypts the payload, gets the relevant fields from the payload and sends back an acknowledge message if necessary.  |
| void | **[onTxDone](/Gateway/Files/comms__protocol_8h/#function-ontxdone)**() |
| String | **[splitAndEncrypt](/Gateway/Files/comms__protocol_8h/#function-splitandencrypt)**(char msg[MAX_PAYLOAD_SIZE]) |
| void | **[sendSensorData](/Gateway/Files/comms__protocol_8h/#function-sendsensordata)**(byte sensorID, byte sensorVal)<br>Adds to the message queue an uplink message containing sensor data.  |
| void | **[getMsgFromQueueAndSend](/Gateway/Files/comms__protocol_8h/#function-getmsgfromqueueandsend)**(unsigned long currentMillis)<br>Get a message from the send queue and send it. Implements retransmission in case an acknowledge message is not received. Aware of a failed transmission.  |
| void | **[sendStatus](/Gateway/Files/comms__protocol_8h/#function-sendstatus)**(byte msgID)<br>Send an uplink message containing the node status.  |
| void | **[sendAck](/Gateway/Files/comms__protocol_8h/#function-sendack)**(byte msgID)<br>Send an acknowledge message confirming the reception of an uplink transmission.  |
| void | **[setActState](/Gateway/Files/comms__protocol_8h/#function-setactstate)**(int ID, int val)<br>Sets the state of the relevant actuator with the relevant value.  |
| int | **[mymin](/Gateway/Files/comms__protocol_8h/#function-mymin)**(int a, int b)<br>returns the minimum value between two integers  |

## Attributes

|                | Name           |
| -------------- | -------------- |
| const uint8_t | **[keyBroadcast](/Gateway/Files/comms__protocol_8h/#variable-keybroadcast)**  |
| const long | **[frequency](/Gateway/Files/comms__protocol_8h/#variable-frequency)**  |
| const int | **[txPower](/Gateway/Files/comms__protocol_8h/#variable-txpower)**  |
| const int | **[spreadingFactor](/Gateway/Files/comms__protocol_8h/#variable-spreadingfactor)**  |
| const long | **[signalBandwidth](/Gateway/Files/comms__protocol_8h/#variable-signalbandwidth)**  |
| const int | **[codingRateDenominator](/Gateway/Files/comms__protocol_8h/#variable-codingratedenominator)**  |
| int | **[currMsg](/Gateway/Files/comms__protocol_8h/#variable-currmsg)**  |
| int | **[count](/Gateway/Files/comms__protocol_8h/#variable-count)**  |
| unsigned long | **[prevMil](/Gateway/Files/comms__protocol_8h/#variable-prevmil)**  |
| unsigned long | **[prevMilSU](/Gateway/Files/comms__protocol_8h/#variable-prevmilsu)**  |
| int | **[msgCount](/Gateway/Files/comms__protocol_8h/#variable-msgcount)**  |
| cppQueue | **[msg_q](/Gateway/Files/comms__protocol_8h/#variable-msg-q)**  |
| aes256_context | **[ctxt](/Gateway/Files/comms__protocol_8h/#variable-ctxt)**  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[IMPLEMENTATION](/Gateway/Files/comms__protocol_8h/#define-implementation)**  |
|  | **[MAX_N_RETRY](/Gateway/Files/comms__protocol_8h/#define-max-n-retry)**  |
|  | **[TIMEOUT_INTERVAL](/Gateway/Files/comms__protocol_8h/#define-timeout-interval)**  |
|  | **[MAX_QUEUE_SIZE](/Gateway/Files/comms__protocol_8h/#define-max-queue-size)**  |
|  | **[BLOCK_SIZE](/Gateway/Files/comms__protocol_8h/#define-block-size)**  |
|  | **[MAX_PAYLOAD_SIZE](/Gateway/Files/comms__protocol_8h/#define-max-payload-size)**  |
|  | **[ENC_BLOCK_SIZE](/Gateway/Files/comms__protocol_8h/#define-enc-block-size)**  |
|  | **[MAX_ENC_PAYLOAD_SIZE](/Gateway/Files/comms__protocol_8h/#define-max-enc-payload-size)**  |
|  | **[MAX_MSG_ID](/Gateway/Files/comms__protocol_8h/#define-max-msg-id)**  |
|  | **[STATUS_UPDATE_INTERVAL](/Gateway/Files/comms__protocol_8h/#define-status-update-interval)**  |
|  | **[BROADCAST_ID](/Gateway/Files/comms__protocol_8h/#define-broadcast-id)**  |

## Detailed Description

Header file for the communication protocol library. Contains the used data structures, function declaration and general configuartion options for the library. 

**Author**: Francisco Santos ([francisco.velez@tecnico.ulisboa.pt](mailto:francisco.velez@tecnico.ulisboa.pt)) 

**Version**: 1.0 

**Date**: 2022-08-10

**Copyright**: Copyright (c) 2022 
## Types Documentation

### typedef Payload

```cpp
typedef struct strPayload Payload;
```


### typedef Msg

```cpp
typedef struct strMsg Msg;
```



## Functions Documentation

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

### function decryptMsg

```cpp
char * decryptMsg(
    String msg
)
```


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

### function onTxDone

```cpp
void onTxDone()
```


### function splitAndEncrypt

```cpp
String splitAndEncrypt(
    char msg[MAX_PAYLOAD_SIZE]
)
```


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


## Attributes Documentation

### variable keyBroadcast

```cpp
const uint8_t keyBroadcast = { 
  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
  0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
  0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x0f
};
```


### variable frequency

```cpp
const long frequency = 868E6;
```


### variable txPower

```cpp
const int txPower = 14;
```


### variable spreadingFactor

```cpp
const int spreadingFactor = 7;
```


### variable signalBandwidth

```cpp
const long signalBandwidth = 125E3;
```


### variable codingRateDenominator

```cpp
const int codingRateDenominator = 5;
```


### variable currMsg

```cpp
int currMsg;
```


### variable count

```cpp
int count;
```


### variable prevMil

```cpp
unsigned long prevMil;
```


### variable prevMilSU

```cpp
unsigned long prevMilSU;
```


### variable msgCount

```cpp
int msgCount;
```


### variable msg_q

```cpp
cppQueue msg_q;
```


### variable ctxt

```cpp
aes256_context ctxt;
```



## Macros Documentation

### define IMPLEMENTATION

```cpp
#define IMPLEMENTATION FIFO
```


### define MAX_N_RETRY

```cpp
#define MAX_N_RETRY 3
```


### define TIMEOUT_INTERVAL

```cpp
#define TIMEOUT_INTERVAL 1000
```


### define MAX_QUEUE_SIZE

```cpp
#define MAX_QUEUE_SIZE 5
```


### define BLOCK_SIZE

```cpp
#define BLOCK_SIZE 16
```


### define MAX_PAYLOAD_SIZE

```cpp
#define MAX_PAYLOAD_SIZE 16
```


### define ENC_BLOCK_SIZE

```cpp
#define ENC_BLOCK_SIZE (1*BLOCK_SIZE)
```


### define MAX_ENC_PAYLOAD_SIZE

```cpp
#define MAX_ENC_PAYLOAD_SIZE ((MAX_PAYLOAD_SIZE/BLOCK_SIZE)*ENC_BLOCK_SIZE)+1
```


### define MAX_MSG_ID

```cpp
#define MAX_MSG_ID 256
```


### define STATUS_UPDATE_INTERVAL

```cpp
#define STATUS_UPDATE_INTERVAL 60000
```


### define BROADCAST_ID

```cpp
#define BROADCAST_ID 0xFF
```


## Source code

```cpp

#ifndef COMMS_PROTOCOL_H
#define COMMS_PROTOCOL_H

#include <Arduino.h>
#include <SPI.h>              
#include <LoRa.h>
#include <cppQueue.h>
#include <aes256.h>
#include "node_definitions.h"

#define  IMPLEMENTATION  FIFO

// LoRa msg payload settings
#define MAX_N_RETRY 3
#define TIMEOUT_INTERVAL 1000
#define MAX_QUEUE_SIZE 5

#define BLOCK_SIZE 16
#define MAX_PAYLOAD_SIZE 16
#define ENC_BLOCK_SIZE (1*BLOCK_SIZE)
#define MAX_ENC_PAYLOAD_SIZE ((MAX_PAYLOAD_SIZE/BLOCK_SIZE)*ENC_BLOCK_SIZE)+1

#define MAX_MSG_ID 256

#define STATUS_UPDATE_INTERVAL 60000

#define BROADCAST_ID 0xFF

// Broadcast Encryption key
const uint8_t keyBroadcast[] = { //
  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
  0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
  0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x0f
};



// LoRa Modem Settings
const long frequency = 868E6;
const int txPower = 14;
const int spreadingFactor = 7;
const long signalBandwidth = 125E3;
const int codingRateDenominator = 5;

typedef struct strPayload {
  byte nodeID;
  byte sensorID;
  byte msgID;
  char flag;
  byte sensorVal;
  int RSSI;
  float SNR;
} Payload;

typedef struct strMsg {
  byte msg[MAX_ENC_PAYLOAD_SIZE];
  byte msgID;
  char flag;
} Msg;

extern int currMsg;
extern int count;
extern unsigned long prevMil;
extern unsigned long prevMilSU;
extern int msgCount;

extern cppQueue msg_q;
extern aes256_context ctxt;

void LoRa_rxMode();
void LoRa_txMode();
void LoRa_sendMessage(byte *message);
char  *decryptMsg(String msg);
char  *decryptMsg2(char msg[MAX_PAYLOAD_SIZE+1]);

void onReceive(int packetSize);
void onTxDone();
String splitAndEncrypt(char msg[MAX_PAYLOAD_SIZE]);
void sendSensorData(byte sensorID, byte sensorVal);
void getMsgFromQueueAndSend(unsigned long currentMillis);
void sendStatus(byte msgID);
void sendAck(byte msgID);
void setActState(int ID, int val);
int mymin(int a, int b);

#endif
```


-------------------------------

Updated on 2022-08-24 at 10:39:41 +0000
