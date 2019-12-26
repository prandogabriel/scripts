#!/bin/bash

#########################################################################
# 									                                    
# compilaTAD.sh - compilar TAD e executar           			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 26/12/2019				                        		
#									                                    
# Descrição: Script para compilar TAD em C e executar                 	
#	     passando o nome do arquivo das funções e o usa_arquivo .c      
#                       como parêmetro	                                
#	                                                                										                                    #
# Exemplo de uso: ./compila.sh	arquivo1.c	usa_arquivo.c          		
#							                                    
#########################################################################

clear

gcc $1 $2 -o teste
./teste
echo ""
