#!/bin/bash

sh build_firmware.sh
avrdude -c arduino -P /dev/ttyACM0 -b 115200 -p atmega328p -D -U flash:w:build/ArduinoUno.hex:i
