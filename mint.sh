#!/bin/bash

###############          SCRIPT POS INTALAÇÃO mint     ############
# 									                                    
# mint.sh -            			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 18/11/2020				                        		
#									                                    
# Descrição: instalar todos os programas e softwares necessários no linux mint                	
#	     pós formatação	                                
#	                                                                										                                    #
# Exemplo de uso: sudo ./mintDebian.sh	         		
#							                                    
#########################################################################


echo -e "\033[01;32m pos-installation script - mint\033[0m" 

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

## Atualizando o repositório depois da adição de novos repositórios ##
echo -e "\033[01;32mRunning apt update after additions\033[0m"
sudo apt update

## Programas do repositório APT##
echo -e "\033[01;32mInstalling programs via APT\033[0m"

# Programas
echo -e "\033[01;32mGcc, git, github cli, build-essential and others\033[0m"
sudo apt install gcc git build-essential filezilla gimp gparted htop inkscape kate virtualbox-6.0 typora vlc yarn libavcodec-extra -y

# ------------------------- Insomnia -----------------------------------
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

#-------------------------------------------------

## Instalando pacotes Flatpak ##
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt update -y

sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.uploadedlobster.peek -y
sudo flatpak install flathub com.obsproject.Studio -y
sudo flatpak install flathub org.telegram.desktop -y
## ----------------------------------------------------------------------

## ------------------ NVM -------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
## -----------------------------------------------------------------------

## Finalização, atualização e limpeza##
echo -e "\033[01;32mFinish the installations\033[0m"
echo -e "\033[01;32mUpdating and cleaning system\033[0m"
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean 
sudo apt autoremove -y

echo -e "\033[01;32;40mTHE END!\033[0m"