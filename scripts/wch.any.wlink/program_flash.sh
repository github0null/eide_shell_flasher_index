#!/bin/bash

firmwareFile=$1

echo "--------------------------------------------------"
echo "firmware: ${firmwareFile}"
echo "--------------------------------------------------"

./wlink flash ${firmwareFile}
