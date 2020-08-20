#!/bin/bash

###############          SCRIPT INSTALAÇÃO ZSH E OH MY ZSH DEBIAN 10     ############
# 									                                    
# zsh.sh -            			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 28/02/2020				                        		
#									                                    
# Descrição: instalar e configurar zsh                            
#	                                                                										                                    #
# Exemplo de uso: sudo ./zsh.sh	       		
#							                                    
#########################################################################


# VERDE - echo -e "\033[01;32m  \033[0m"
# AMARELO - echo -e "\033[01;33m \033[0m"

# echo -e "\033[01;32mDracula Theme Terminal\033[0m"

# sudo apt-get install dconf-cli

# git clone https://github.com/dracula/gnome-terminal

# cd gnome-terminal

# ./install.sh


# Install hyper terminal
echo -e "\033[01;32mHyper terminal\033[0m"
wget https://releases.hyper.is/download/deb
sudo dpkg -i deb
sudo rm -rf deb
# setar como padrão
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50

# plugin para bolinhas coloridas
hyper install hyper-custom-controls

mkdir ~/.hyper_plugins/local/hyper-omni

git clone https://github.com/getomni/hyper-omni ~/.hyper_plugins/local/hyper-omni
# Install hyper terminal

# ZSH
echo -e "\033[01;32mZSH\033[0m"
sudo apt install zsh -y


echo -e "\033[01;32moh my zsh\033[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# install gerenciador de plugins
echo -e "\033[01;32install zinit\033[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)" -n


# para volatar aparecer os softwares do snap
echo -e "emulate sh -c 'source /etc/profile'">>/etc/zsh/zprofile


#thema spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# jogar config para o arquivo .zshrc

rm ~/.zshrc
cp zsh.txt ~/.zshrc

echo -e "\033[01;32mZSH Pronto, reinicie e seja feliz!\033[0m"

echo -e "\033[01;33mReiniciar agora? (s/n) \033[0m" && read x && [[ "$x" == "s" ]] && /sbin/reboot
