#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&

echo -e "${BLUE}Removing wolfram-engine...${NC}" &&
sudo apt-get purge -y wolfram-engine &&

echo -e "${BLUE}Removing libreoffice...${NC}" &&
sudo apt-get purge -y libreoffice* &&

echo -e "${BLUE}Removing oracle-java...${NC}" &&
sudo apt-get purge -y oracle-java* &&

echo -e "${BLUE}Removing scratch2...${NC}" &&
sudo apt-get purge -y scratch2 &&

echo -e "${BLUE}Removing scratch...${NC}" &&
sudo apt-get purge -y scratch &&

echo -e "${BLUE}Running autoremove...${NC}" &&
sudo apt-get autoremove -y &&

echo -e "${BLUE}Running clean...${NC}" &&
sudo apt-get clean &&

echo -e "${BLUE}Removing opencv compilation files...${NC}" &&
rm -rf opencv-3.3.0 &&
rm -rf opencv_contrib-3.3.0 &&
rm -rf opencv.zip &&
rm -rf opencv_contrib.zip &&

echo -e "${GREEN}Done!${NC}"
