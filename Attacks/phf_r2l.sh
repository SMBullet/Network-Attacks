#!/bin/bash

#phf r2l
# Function to check if a command is available
command_exists() {
    command -v "$1" &> /dev/null
}

# Check if Apache2 is installed
if ! command_exists apache2; then
    echo "Apache2 is not installed. Installing..."
    sudo apt update
    sudo apt install -y apache2
fi

sudo a2enmod cgi
sudo systemctl restart apache2

# Create a vulnerable CGI script
sudo tee /usr/lib/cgi-bin/phf.cgi > /dev/null <<EOF
#!/bin/bash
echo "Content-type: text/plain"
echo ""
cat /etc/passwd
EOF

# Set permissions for the script
sudo chmod +x /usr/lib/cgi-bin/phf.cgi

# Install curl for testing
if ! command_exists curl; then
    echo "curl is not installed. Installing..."
    sudo apt install -y curl
fi

# Test the vulnerability
curl http://localhost/cgi-bin/phf.cgi

# Check if Firefox is installed
if ! command_exists firefox; then
    echo "Firefox is not installed. Installing..."
    sudo apt install -y firefox
fi

# Open the vulnerable URL in Firefox
firefox http://localhost/cgi-bin/phf.cgi &
