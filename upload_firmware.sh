#!/bin/bash

UploadPort="/dev/ttyACM0"
UploadBaud="115200"
ExecName="ArduinoUno"

sh build_firmware.sh
echo "Uploading Firmware"
avrdude -c arduino -P ${UploadPort} -b ${UploadBaud} -p atmega328p -D -U flash:w:build/${ExecName}.hex:i
