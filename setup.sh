#!/bin/bash

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
sudo apt-add-repository ppa:mixxx/mixxx


## Cinelerra CV; great video editor
sudo add-apt-repository ppa:cinelerra-ppa/ppa;


## Clementine music player
sudo add-apt-repository ppa:me-davidsansome/clementine

## Show startup apps as per http://ubuntuhandbook.org/index.php/2013/11/show-all-hidden-startup-applications-ubuntu1310/
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop


sudo apt-get install terminator google-chrome-stable \
atom htop mixxx gnome-tweak-tool arc-theme numix-gtk-theme \
ubuntu-restricted-extras gimp open-ssh virtualbox knocker \
cinelerra-cv clementine
;

## Wallpaper changer
git clone https://github.com/neffo/bing-wallpaper-gnome-extension.git $HOME/.local/share/gnome-shell/extensions/BingWallpaper@ineffable-gmail.com



