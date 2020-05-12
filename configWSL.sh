#!/bin/bash

###############          SCRIPT CONFIGURAÇÃO DEBIAN 10 WSL WINDOWS ######
# 									                                    
# configWSL.sh -            			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 23/03/2019				                        		
#									                                    
# Descrição: instalar todos os programas e softwares necessários do Debian 10                	
#	     no WSL	                                
#	                                                                										                                    #
# Exemplo de uso: sudo ./configWSL.sh	         		
#							                                    
#########################################################################


echo -e "\033[01;32m Debian 10 in WSL \033[0m" 

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

## -------jdk-------
echo -e "\033[01;32mInstall jdk \033[0m" 
sudo apt-get install default-jdk
## -------jdk-------

## -------node-------
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
## -------node-------

## -------Yarn--------
echo -e "\033[01;32mYarn\033[0m"
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
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

# Docker
echo -e "\033[01;32mDocker and dependencies\033[0m"
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Programas
echo -e "\033[01;32mGcc, gcc , github Cli\033[0m"
sudo apt install gcc npm hub

## ----------------------------------------------------------------------

## Finalização, atualização e limpeza##
echo -e "\033[01;32mFinish the installations\033[0m"
echo -e "\033[01;32mUpdating and cleaning system\033[0m"
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean 
sudo apt autoremove -y

echo -e "\033[01;32;40mTHE END!\033[0m"