#!/bin/bash

###############          SCRIPT INTALAÇÃO DRIVES ADAPTADOR WI-FI USB  TL-WN725N - TP LINK (DEBIAN 10) ############
#
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 26/02/2020				                        		
#									                                    
# Descrição: drive para TL-WN725N funcionar no debian	                                
#	                                                                										                                    #
# Exemplo de uso: sudo ./driver_wifi.sh         		
# 							                                    
##################################################################################################################

echo -e "\033[01;32m Install drives TL-WN725N - TP LINK 10\033[0m" 
##  ATUALIZAR ##
echo -e "\033[01;32m Update pc \033[0m"
apt-get update
apt-get dist-upgrade
##  ATUALIZAR ##

## INSTALAR GCC ##
echo -e "\033[01;32m install gcc \033[0m"
#apt-get install gcc
apt-get install gcc-5

# CLONE DO REPOSITÓRIO DRIVES
echo -e "\033[01;32m clone drives \033[0m"
git clone https://github.com/lwfinger/rtl8188eu
# CLONE DO REPOSITÓRIO DRIVES

## ACESSAR PASTA PARA INSTALAR DRIVES ##
echo -e "\033[01;32m enter folder \033[0m"
cd rtl8188eu
## ACESSAR PASTA PARA INSTALAR DRIVES ##

## INSTALAR ##
echo -e "\033[01;32m install \033[0m"

make all
make install
## INSTALAR ##

echo -e "\033[01;32;40mTHE END!\033[0m"

sudo reboot

