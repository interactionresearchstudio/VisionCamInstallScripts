#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&
echo -e "${BLUE}Changing hostname to visioncam...${NC}" &&
sudo sed -i "s/raspberrypi.*/visioncam/" /etc/hostname &&
sudo sed -i "s/raspberrypi.*/visioncam/" /etc/hosts &&

echo -e "${GREEN}Done! Please restart manually to confirm that the hostname has changed.${NC}"
