#!/bin/bash

#########################################################################
# 									                                    
# Compila.sh - compilar e executar arquivo em C 			            
#									                                    
# Autor: Gabriel Prando (gprando55@gmail.com)                          	
# Data Criação: 26/12/2019				                        		
#									                                    
# Descrição: Script para compilar arquivo C e execuar                 	
#	     passando o nome do arquivo .c como parêmetro	                
#	                                                                	
#									                                    
# Exemplo de uso: ./compila.sh	arquivo.c	                    		
#									                                    
#########################################################################

clear

gcc $1 -o teste
./teste
echo ""
