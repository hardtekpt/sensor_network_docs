---
title: node_definitions.h
summary: Header file for the node program. Contains hardware pinouts, LoRa modem configs and node settings. 

---

# node_definitions.h

Header file for the node program. Contains hardware pinouts, LoRa modem configs and node settings.  [More...](#detailed-description)

## Attributes

|                | Name           |
| -------------- | -------------- |
| const byte | **[netID](/Node/Files/node__definitions_8h/#variable-netid)**  |
| const int | **[sensN](/Node/Files/node__definitions_8h/#variable-sensn)**  |
| const int | **[actN](/Node/Files/node__definitions_8h/#variable-actn)**  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[BAUD_RATE](/Node/Files/node__definitions_8h/#define-baud-rate)**  |

## Detailed Description

Header file for the node program. Contains hardware pinouts, LoRa modem configs and node settings. 

**Author**: Francisco Santos ([francisco.velez@tecnico.ulisboa.pt](mailto:francisco.velez@tecnico.ulisboa.pt)) 

**Version**: 1.0 

**Date**: 2022-08-10

**Copyright**: Copyright (c) 2022 


## Attributes Documentation

### variable netID

```cpp
const byte netID = 0xF3;
```


### variable sensN

```cpp
const int sensN = sizeof(sensPin)/sizeof(int);
```


### variable actN

```cpp
const int actN = sizeof(actPin)/sizeof(int);
```



## Macros Documentation

### define BAUD_RATE

```cpp
#define BAUD_RATE 115200
```


## Source code

```cpp

#ifndef NODE_DEFINITIONS_H
#define NODE_DEFINITIONS_H

// Baud rate for serial communication
#define BAUD_RATE 115200

// Node Settings
const byte netID = 0xF3;

#include "node_definitions/node_definitions_3.h"

const int sensN = sizeof(sensPin)/sizeof(int);
const int actN = sizeof(actPin)/sizeof(int);

#endif
```


-------------------------------

Updated on 2022-08-24 at 10:39:39 +0000
