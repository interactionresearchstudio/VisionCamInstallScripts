#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&
echo -e "${BLUE}Updating...${NC}" &&
sudo apt-get -y update && 

echo -e "${BLUE}Installing picamera...${NC}" &&
pip install picamera &&
pip3 install picamera &&

echo -e "${BLUE}Installing imutils...${NC}" &&
pip install imutils &&
pip3 install imutils &&

echo -e "${BLUE}Installing avconv...${NC}" &&
sudo apt-get install -y libav-tools &&

echo -e "${BLUE}Installing PiTFT...${NC}" &&
echo -e "${RED}Please choose the following settings: Display: 2 / Rotation: 1 / Show console: n / Mirror HDMI: y${NC}" &&
wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/adafruit-pitft.sh &&
chmod +x adafruit-pitft.sh &&
sudo ./adafruit-pitft.sh
