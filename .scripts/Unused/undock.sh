#!/bin/zsh

osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true and local volume is true and free space is not equal to 0)' && SafeEjectGPU Eject 0xad06
