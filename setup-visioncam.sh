#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&

echo -e "${BLUE}Cloning LinedrawingTimelapse...${NC}" &&
git clone https://github.com/interactionresearchstudio/LinedrawingTimelapse.git &&

echo -e "${BLUE}Creating splash screen init process...${NC}" &&
sudo wget -P /etc/systemd/system/ https://gist.githubusercontent.com/mikevanis/7fae932f0540d26ce841f8ac8553a273/raw/863e737f0cb1f2dc862b4e12808cc5a2a2d9f944/splashscreen.service &&
sudo systemctl enable splashscreen &&
wget https://raw.githubusercontent.com/interactionresearchstudio/VisionCamInstallScripts/master/assets/splash.png &&
sudo cp /home/pi/splash.png /usr/share/plymouth/themes/pix/splash.png &&

echo -e "${BLUE}Creating .xsession file...${NC}" &&
wget https://gist.githubusercontent.com/mikevanis/82bc154f25b53cfba6237dbfd49d7024/raw/4d53882902d13fd5a8934f41bc9455442703caa6/Xsession &&
mv Xsession .xsession &&
chmod +x .xsession &&

echo -e "${BLUE}Changing PiTFT scaling...${NC}" &&
sudo sed -i 's/hdmi_cvt.*/hdmi_cvt=320 240 60 1 0 0 0/' /boot/config.txt &&

echo -e "${GREEN}Done! Please restart manually to confirm installation.${NC}" 
