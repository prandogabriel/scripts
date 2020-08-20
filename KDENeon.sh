#!/bin/bash

###############          SCRIPT PÓS INTALAÇÃO KDE NEON    ############
# 									                                    
# posInstalacaoNotebook.sh -            			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 17/08/2020				                        		
#									                                    
# Descrição: instalar todos os programas e softwares necessários no kde neon               	
#	     pós formatação	                                
#	                                                                										 
# Exemplo de uso: sudo ./KDENeon.sh	         		
#							                                    
#########################################################################


echo -e "\033[01;32m pos-installation script - KDE Neon 10\033[0m" 

## ----------------------------------------------------------------------
## Removendo travas eventuais do apt ##
echo -e "\033[01;32mRemoving eventually locks from apt\033[0m" 
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
## ----------------------------------------------------------------------
## Adicionando/Confirmando arquitetura de 32 bits ##
echo -e "\033[01;32mAdd 32 bits architecture to dpkg\033[0m" 
sudo dpkg --add-architecture i386 

## Atualizando o repositório ##
echo -e "\033[01;32mRunning the apt update\033[0m" 
sudo apt update


## Adicionando repositórios de terceiros e suporte a Snap ##
echo -e "\033[01;32mAdd third party repositories\033[0m"

## -------Typora-------
echo -e "\033[01;32mTypora\033[0m"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./' -y
## -------/Typora------

## --------cURL------
echo -e "\033[01;32mInstall cURL\033[0m"
sudo apt install curl -y
## -------/cURL------

## -------Yarn--------
echo -e "\033[01;32mYarn\033[0m"
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
## -------/Yarn-------

## -------Docker-------
echo -e "\033[01;32mDocker\033[0m"
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
## -------/Docker------

## Atualizando o repositório depois da adição de novos repositórios ##
echo -e "\033[01;32mRunning apt update after additions\033[0m"
sudo apt update -y

## Programas do repositório APT##
echo -e "\033[01;32mInstalling programs via APT\033[0m"

## Snap
echo -e "\033[01;32mSnap\033[0m"
sudo apt install snapd -y

# Docker
echo -e "\033[01;32mDocker and dependencies\033[0m"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo groupadd docker

# Programas
echo -e "\033[01;32mGcc, git, github cli, build-essential and others\033[0m"
sudo apt install clang cppcheck gcc hub build-essential filezilla gimp gparted htop inkscape typora vlc yarn libavcodec-extra -y


sudo apt update -y

sudo apt install git -y

## Configurando git
git config --global user.name "Gabriel Prando"
git config --global user.email "gprando55@gmail.com"
git config --global color.ui true
## ----------------------------------------------------------------------

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

## Instalando pacotes Snap ##
echo -e "\033[01;32mInstalling snap packages\033[0m"
echo -e "\033[01;32mArduino, insomnia, audacity, discord, robo3t, go, vscode, heroku, android-studio\033[0m"
echo -e "\033[01;32mRedis, node-red, spotify, photogimp, instagraph and snap-store\033[0m"
sudo snap install arduino-mhall119
sudo snap install insomnia
sudo snap install audacity
sudo snap install discord
sudo snap install robo3t-snap
sudo snap install go --classic
sudo snap install code --classic
sudo snap install heroku --classic
sudo snap install gitkraken
sudo snap install redis-desktop-manager
sudo snap install node-red
sudo snap install snap-store
sudo snap install spotify
sudo snap install photogimp
sudo snap install postbird
sudo snap install dbeaver-ce
sudo snap install peek

## ----------------------------------------------------------------------

echo -e "\033[01;32mFont fira code\033[0m"
sudo apt install fonts-firacode -y


## -------/Java_8------
echo -e "\033[01;32mInstall jdk 8\033[0m"
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update -y
sudo apt-get install openjdk-8-jdk -y
## -------/Java_8------

# config para o android studio
echo -e "\033[01;32mAndroid studio\033[0m"
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y


## Finalização, atualização e limpeza##
echo -e "\033[01;32mFinish the installations\033[0m"
echo -e "\033[01;32mUpdating and cleaning system\033[0m"
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean 
sudo apt autoremove -y
## Finalização, atualização e limpeza##

echo -e "\033[01;32;40mTHE END!\033[0m"