#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

cd ~ &&
echo -e "${BLUE}Updating...${NC}" &&
sudo apt-get -y update && sudo apt-get -y upgrade &&
echo -e "${BLUE}Installing compilation dependencies...${NC}" &&
sudo apt-get -y install build-essential cmake pkg-config &&
echo -e "${BLUE}Installing image I/O dependencies...${NC}" &&
sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev &&
echo -e "${BLUE}Installing video I/O dependencies...${NC}" &&
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev &&
sudo apt-get -y install libxvidcore-dev libx264-dev &&
echo -e "${BLUE}Installing GUI dependencies...${NC}"
sudo apt-get -y install libgtk2.0-dev libgtk-3-dev &&
echo -e "${BLUE}Installing optimisation dependencies...${NC}" &&
sudo apt-get -y install libatlas-base-dev gfortran &&
echo -e "${BLUE}Installing Python 2.7 and Python 3...${NC}" &&
sudo apt-get -y install python2.7-dev python3-dev &&

echo -e "${BLUE}Downloading OpenCV source...${NC}" &&
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.3.0.zip &&
unzip opencv.zip &&

wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip &&
unzip opencv_contrib.zip &&

echo -e "${BLUE}Installing pip...${NC}" &&
wget https://bootstrap.pypa.io/get-pip.py &&
sudo python get-pip.py &&
sudo python3 get-pip.py &&

echo -e "${BLUE}Installing NumPy...${NC}" &&
pip install numpy &&
pip3 install numpy &&

echo -e "${BLUE}Setting up cmake...${NC}" &&
cd ~/opencv-3.3.0/ &&
mkdir build &&
cd build &&
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules \
    -D BUILD_EXAMPLES=ON .. &&
echo -e "${BLUE}cmake done. ${RED}Please check its output!!!${NC}" &&
sleep 5 &&

echo -e "${BLUE}Changing swap size to compile with all cores...${NC}" &&
sudo sed -i 's/CONF_SWAPSIZE.*/CONF_SWAPSIZE=1024/' /etc/dphys-swapfile &&
sudo /etc/init.d/dphys-swapfile stop &&
sudo /etc/init.d/dphys-swapfile start &&

echo -e "${BLUE}Starting make...${NC}" &&
make -j4 &&

echo -e "${BLUE}Installing...${NC}" &&
sudo make install &&
sudo ldconfig &&

echo -e "${BLUE}Changing swap size back to original settings...${NC}" &&
sudo sed -i 's/CONF_SWAPSIZE.*/CONF_SWAPSIZE=100/' /etc/dphys-swapfile &&
sudo /etc/init.d/dphys-swapfile stop &&
sudo /etc/init.d/dphys-swapfile start &&

echo -e "${GREEN}Done! Please check installation manually.${NC}" 

