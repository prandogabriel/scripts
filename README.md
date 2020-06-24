<h1 align="center">Scripts   </h1>
<p align="center">
<strong>Scripts de automatização de processos no bash</strong>
</p>


<p align="center">
  <a aria-label="Prando" href="https://github.com/gprando/">
    <img src="https://img.shields.io/github/followers/gprando?style=social"></img>
  </a>
    <img src="https://img.shields.io/github/last-commit/gprando/scripts"></img>
    <img src="https://img.shields.io/github/languages/count/gprando/scripts"></img>
</p>


<p align="center">
  <a href="#-instalação-e-execução">Instalação e execução</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-contribuir">Como contribuir</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-licença">Licença</a>
</p>

## 🚀 Instalação e execução

<br/>

1. Abra o terminal do seu computador. Se estiver no Windows, pode ser o Prompt de Comando ou PowerShell. Caso use o WSL no Windows, use o Windows Terminal, usando o Ubuntu ou qualquer distribuição suportada pelo WSL. 
2. Altere o diretório de trabalho atual para o local em que deseja ter o código do módulo salvo no seu computador.
3. Faça um clone desse repositório rodando: <br> `git clone https://github.com/gprando/scripts`;
4. Entre na pasta rodando pelo terminal: `cd scripts`;
5. Dê permissão aos scripts <br/> `chmod +x *.sh `;
6. Para executar o script `sudo ./nomeDoScript.sh`.

### Adiconar scripts no PATH para poderem ser usados em qualquer diretório via terminal

- abrir arquivo .profile e atribuir o repositório dos scripts a variável PATH, no terminal:  
      
       vi ~/.profile  
      
    Atribuir no final do arquivo que a variavel PATH irá receber o valor atual + o novo repositório.  
      
      PATH="$PATH:$USER/caminhoDoRepositório"
    Após salvar os scripts poderão ser executados em qualquer repositório via bash !

#### Para Executar os scripts

  Em qualquer pasta `nomeScript.sh`


## 🤔 Como contribuir

Se quiser contribuir para esse repositório aqui, seja corrigindo algum problema, adicionando comentários ou melhorando a documentação, você pode seguir esse tutorial abaixo:

- Faça [um fork](https://help.github.com/pt/github/getting-started-with-github/fork-a-repo) desse repositório;
- Entre no seu perfil no GitHub e faça um clone do repositório que você fez um *fork*;
- Crie uma *branch* com a sua alteração: `git checkout -b minha-alteracao`;
- Faça as alterações necessárias no código ou na documentação;
- Faça *commit* das suas alterações: `git commit -m 'feat: Minha nova feature'`;
- Faça *push* para a sua *branch*: `git push origin minha-alteracao`;
- Agora é só abrir a sua *pull request* no repositório que você fez o *fork*;

Depois que o *merge* da sua *pull request* for feito, você pode deletar a sua *branch*.

## :memo: Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.

---


com  :heart: [Gabriel Prando](https://github.com/gprando)    

