# Shell Script
## scripts de automatização de processos no bash

### Adiconar scripts no PATH para poderem ser usados em qualquer diretório via terminal

- abrir arquivo .profile e atribuir o repositório dos scripts a variável PATH, no terminal:  
      
       vi ~/.profile  
      
    Atribuir no final do arquivo que a variavel PATH irá receber o valor atual + o novo repositório.  
      
      PATH="$PATH:~"user"/caminhoDoRepositório"
    Após salvar os scripts poderão ser executados em qualquer repositório via bash !