#!/bin/bash

function erase() {

    echo "--------------------------------------------------"
    echo "- erase all"
    echo "--------------------------------------------------"
    echo

    ./tools/msp430_flasher/MSP430Flasher -e ERASE_ALL -g -z '[VCC]'

    return $?
}

function program() {

    firmwareFile=$1

    echo "--------------------------------------------------"
    echo "- firmware: ${firmwareFile}"
    echo "--------------------------------------------------"
    echo

    ./tools/msp430_flasher/MSP430Flasher -w "${firmwareFile}" -v -g -z '[VCC]'

    return $?
}

if [ "$1" == "eraseAll" ]; then
    erase
else
    program $1
fi

if [ $? -eq 0 ]; then
    printf "\n"
    printf "\033[32;1m##### SUCCESS #####\033[0m\n"
    printf "\n"
else
    printf "\n"
    printf "\033[31;1m##### FAILED #####\033[0m\n"
    printf "\n"
fi

#
# MSP430Flasher Usage:
#
#  -n DEVICE_NAME              (optional for MSP430, required for MSP432)        
#                              specifies the name of the target MSP - prompt in  
#                              case of mismatch
#                              Use -n NO_TARGET to run MSP Flasher without       
#                              attempting a target connection (FET detection or  
#                              FET firmware update only)
# -i (TI)USB | DETECT |       specifies the COM port of a connected debug tool  
#     COMn (Win) |             (default: TIUSB/USB = first detected FET tool is  
#     ttyACMn (Linux) |        used) For info on how to connect to specific eZ-
#     usbmodem* (OSX)          tools, see the MSP Flasher manual.
#                              Use -i DETECT  to execute a FET detection sweep,
#                              displaying detailed info about all connected debug
#                              tools. User is prompted to pick a FET.
#
# -v filename (optional)      triggers verification of the target memory against
#                              a target code file. If -w is used, no argument is
#                              required. For a stand-alone verify, provide the
#                              path to a target code file as an argument.
#
# -g                          switches log OFF (default: ON)
#
# -z [exit_spec,...]          specifies state of device on exit
#                              (view available 'exit_spec's using -x switch)
#                              [VCC] or [RESET]
