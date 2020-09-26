#!/bin/bash

###############          SCRIPT POS INTALAÇÃO LMDB     ############
# 									                                    
# mintDebian.sh -            			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 26/09/2020				                        		
#									                                    
# Descrição: instalar todos os programas e softwares necessários no linux mint debian               	
#	     pós formatação	                                
#	                                                                										                                    #
# Exemplo de uso: sudo ./mintDebian.sh	         		
#							                                    
#########################################################################


echo -e "\033[01;32m pos-installation script - LMDB\033[0m" 

## ----------------------------------------------------------------------
## Removendo travas eventuais do apt ##
echo -e "\033[01;32mRemoving eventually locks from apt\033[0m" 
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
## ----------------------------------------------------------------------
## Adicionando/Confirmando arquitetura de 32 bits ##
echo -e "\033[01;32mAdd 32 bits architecture to dpkg\033[0m" 
sudo dpkg --add-architecture i386 

## Add non-free to official repositories
echo -e "\033[01;32mAdd contrib and non-free to official repositories\033[0m" 
sudo apt-add-repository contrib
sudo apt-add-repository non-free

## Atualizando o repositório ##
echo -e "\033[01;32mRunning the apt update\033[0m" 
sudo apt update

## Adicionando repositórios de terceiros ##
echo -e "\033[01;32mAdd third party repositories\033[0m"

## -------VirtualBox-------
echo -e "\033[01;32mVirtual Box\033[0m"
echo "deb https://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
## -------/VirtualBox------

## -------Typora-------
echo -e "\033[01;32mTypora\033[0m"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./' -y
## -------/Typora------

## --------cURL------
echo -e "\033[01;32mInstall cURL\033[0m"
sudo apt install curl
## -------/cURL------

## -------Yarn--------
echo -e "\033[01;32mYarn\033[0m"
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
## -------/Yarn-------

## -------Docker-------
echo -e "\033[01;32mDocker\033[0m"
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" -y
## -------/Docker------

## Atualizando o repositório depois da adição de novos repositórios ##
echo -e "\033[01;32mRunning apt update after additions\033[0m"
sudo apt update

## Programas do repositório APT##
echo -e "\033[01;32mInstalling programs via APT\033[0m"

# Docker
echo -e "\033[01;32mDocker and dependencies\033[0m"
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Programas
echo -e "\033[01;32mGcc, git, github cli, build-essential and others\033[0m"
sudo apt install gcc git build-essential filezilla gimp gparted htop inkscape kate virtualbox-6.0 typora vlc yarn libavcodec-extra -y

## Configurando git
git config --global user.name "Gabriel Prando"
git config --global user.email "gprando55@gmail.com"
git config --global color.ui true
## ----------------------------------------------------------------------

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
sudo flatpak install flathub com.visualstudio.code -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.uploadedlobster.peek -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub org.octave.Octave -y
sudo flatpak install flathub com.obsproject.Studio -y
sudo flatpak install flathub org.telegram.desktop -y
## ----------------------------------------------------------------------

## ------------------ NVM -------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
## -----------------------------------------------------------------------

## --------------------------- Kubectl -------------------------------------------
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
## ------------------------------------------------------------------------------

## Finalização, atualização e limpeza##
echo -e "\033[01;32mFinish the installations\033[0m"
echo -e "\033[01;32mUpdating and cleaning system\033[0m"
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean 
sudo apt autoremove -y

echo -e "\033[01;32;40mTHE END!\033[0m"
