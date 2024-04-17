#snmpguess r2l

#https://github.com/hatlord/snmpwn (users)

#https://github.com/stringbleed/tools/tree/master/community_fuzz

sudo apt update
sudo apt install git

git clone https://github.com/stringbleed/tools
cd tools
cd community_fuzz

python3 fuzzCommStr-v1.py $1 1 A 50