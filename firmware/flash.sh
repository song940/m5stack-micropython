#!/bin/sh

FLASH_COMPORT="/dev/tty.SLAB_USBtoUART"
FLASH_BDRATE="460800"

esptool.py --chip esp32 --port ${FLASH_COMPORT} --baud ${FLASH_BDRATE} erase_flash
esptool.py --chip esp32 --port ${FLASH_COMPORT} --baud ${FLASH_BDRATE} --before default_reset --after no_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect 0x1000 bootloader.bin 0xf000 phy_init_data.bin 0x10000 MicroPython.bin 0x8000 partitions_mpy.bin