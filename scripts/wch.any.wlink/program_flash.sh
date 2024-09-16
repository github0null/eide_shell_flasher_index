#!/bin/bash

firmwareFile=$1

echo "--------------------------------------------------"
echo "firmware: ${firmwareFile}"
echo "--------------------------------------------------"

./tools/wlink flash ${firmwareFile}
