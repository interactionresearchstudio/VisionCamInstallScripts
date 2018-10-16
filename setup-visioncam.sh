#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&

echo -e "${BLUE}Cloning LinedrawingTimelapse...${NC}" &&
git clone https://github.com/interactionresearchstudio/LinedrawingTimelapse.git &&

echo -e "${BLUE}Creating splash screen init process...${NC}" &&
sudo wget -P https://raw.githubusercontent.com/interactionresearchstudio/VisionCamInstallScripts/master/assets/splashscreen.service &&
sudo systemctl enable splashscreen &&
wget https://raw.githubusercontent.com/interactionresearchstudio/VisionCamInstallScripts/master/assets/splash.png &&
sudo cp /home/pi/splash.png /usr/share/plymouth/themes/pix/splash.png &&

echo -e "${BLUE}Creating .xsession file...${NC}" &&
wget https://raw.githubusercontent.com/interactionresearchstudio/VisionCamInstallScripts/master/assets/Xsession &&
mv Xsession .xsession &&
chmod +x .xsession &&

echo -e "${BLUE}Changing PiTFT scaling...${NC}" &&
sudo sed -i 's/hdmi_cvt.*/hdmi_cvt=320 240 60 1 0 0 0/' /boot/config.txt &&

echo -e "${BLUE}Disabling screen blanking...${NC}" &&
sudo sed -i 's/xserver-command.*/xserver-command=X -s 0 -dpms/' /etc/lightdm/lightdm.conf &&

echo -e "${GREEN}Done! Please restart manually to confirm installation.${NC}" 
