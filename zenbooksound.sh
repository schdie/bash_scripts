#!/bin/bash
# v.01
# updated: 01-09-2022

# we need root
if [ "$EUID" != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# coeff node is 0x20
echo -e "Fixing windows coeff f*ck up for the asus zenbook ux330ua"
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x08
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x6a8c
sleep 1
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x1a
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x8003
sleep 1
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x31
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0xd200
sleep 1
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x3a
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x0010
sleep 1
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x40
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x9800
sleep 1
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x45
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x5289
sleep 1
echo -e "Done."
