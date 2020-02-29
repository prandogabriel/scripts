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

sudo apt install zsh


sudo usermod --shell $(which zsh) $USER
sudo usermod --shell $(which zsh) root

# para volatar aparecer os softwares do snap
echo -e "emulate sh -c 'source /etc/profile'">>/etc/zsh/zprofile

# install oh my zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

#thema spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install gerenciadro de plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"


# jogar config para o arquivo .zshrc

rm ~/.zshrc
cp zsh.txt ~/.zshrc

echo -e "\033[01;32mZSH Pronto, reinicie e seja feliz!\033[0m"

echo -e "\033[01;33mReiniciar agora? (s/n) \033[0m" && read x && [[ "$x" == "s" ]] && /sbin/reboot
