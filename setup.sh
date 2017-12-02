#!/bin/bash

## Move buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'


sudo apt-get update; sudo apt-get upgrade;
sudo apt-get install aptitude build-essential curl synaptic git ;

## Terminator
sudo add-apt-repository ppa:gnome-terminator;

## Google chrome as per
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list


## Atom editor as per https://www.ubuntuupdates.org/ppa/atom
sudo add-apt-repository ppa:webupd8team/atom;


## Nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

## Mixx DJ software as per https://www.mixxx.org/manual/latest/chapters/installation.html#installation-on-gnu-linux
## sudo apt-add-repository ppa:mixxx/mixxx


## Cinelerra CV; great video editor
sudo add-apt-repository ppa:cinelerra-ppa/ppa;


## Clementine music player
sudo add-apt-repository ppa:me-davidsansome/clementine

## Show startup apps as per http://ubuntuhandbook.org/index.php/2013/11/show-all-hidden-startup-applications-ubuntu1310/
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop


## Laptop tools for performance and battery life as per http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html#installation
sudo add-apt-repository ppa:linrunner/tlp

## VLC Daily build (might be unstable)
sudo add-apt-repository ppa:videolan/stable-daily



sudo aptitude update;
sudo aptitude install terminator google-chrome-stable \
atom htop mixxx gnome-tweak-tool \
ubuntu-restricted-extras gimp ssh virtualbox knocker \
cinelerra-cv clementine tlp acpi-call-dkms gtkpod vlc net-tools dos2unix \
pwgen easytag


## Install Hercules DJ Controller RMX Udev rule
sudo wget https://raw.githubusercontent.com/mixxxdj/mixxx/master/res/linux/mixxx.usb.rules -O /etc/udev/rules.d/mixxx.usb.rules
ME=`whoami`
sudo usermod -aG users $ME

## Wallpaper changer
git clone https://github.com/neffo/bing-wallpaper-gnome-extension.git $HOME/.local/share/gnome-shell/extensions/BingWallpaper@ineffable-gmail.com


## Platformio, use USB devices
sudo usermod -aG dialout $ME


### Make it so GDM does not start pulseaudio as per https://www.debuntu.org/how-to-disable-pulseaudio-and-sound-in-gdm/ (for bluetooth pairing)
sudo mkdir -p /var/lib/gdm/.pulse/
sudo touch /var/lib/gdm3/.pulse/client.conf ; sudo chmod 777 /var/lib/gdm3/.pulse/client.conf
echo "autospawn = no" > /var/lib/gdm3/.pulse/client.conf
echo "daemon-binary = /bin/true" >> /var/lib/gdm3/.pulse/client.conf
sudo chmod 640 /var/lib/gdm3/.pulse -R
sudo chown gdm:gdm /var/lib/gdm3/.pulse  -R
