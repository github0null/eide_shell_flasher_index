#!/bin/bash

firmwareFile=$(echo $1 | sed 's/\\/\//g')

./tools/wch_openocd/bin/openocd.exe -f ../bin/wch-riscv.cfg \
    -c init -c halt \
    -c "flash erase_sector wch_riscv 0 last" \
    -c "program ${firmwareFile}" \
    -c "verify_image ${firmwareFile}" \
    -c wlink_reset_resume -c exit