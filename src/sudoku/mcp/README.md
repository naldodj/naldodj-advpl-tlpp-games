🧠 MCP no Protheus com base no Harbour: integração prática com Python e TL++ 🎮

https://github.com/user-attachments/assets/2424b532-5146-44c4-9024-4d6dab59b45a

---

Você sabia que é possível executar um servidor MCP (Multi-Code Processor) dentro do ecossistema TOTVS Protheus, utilizando recursos herdados diretamente do Harbour?

Acabo de publicar um experimento prático que demonstra isso com a execução do jogo Sudoku, onde o servidor MCP é escrito em Harbour, recebe comandos via stdin, interpreta código TL++ e aciona recursos externos como o navegador através de scripts Python.

🔍 O que este exemplo mostra:

Um servidor MCP escrito em Harbour que interpreta comandos em tempo real;

A capacidade de acionar ferramentas ou jogos externos dinamicamente com o uso de TL++;

Um script em Python (opensudoku.py) que se comunica com o MCP e executa o comando open_sudoku;

Um arquivo .mcp.tlpp com a definição da lógica de chamada.

🛠️ Arquivos envolvidos:
🧩 Servidor MCP: hb_totvs_mcp.prg

🐍 Script Python de interface: opensudoku.py

🧠 Definição da ferramenta TL++: sudoku.mcp.tlpp

Esse modelo pode ser expandido para chamadas seguras, autenticação, controle de acesso, testes automatizados e muito mais — tudo isso com o poder de um servidor leve, interpretado e extensível.

🔗 Acesse o repositório completo:
github.com/naldodj/naldodj-advpl-tlpp-games

---

#TOTVS #Protheus  #HarbourLang #ADVPL #DesenvolvimentoERP #PythonAutomation  #OpenSource #GameDev #TLPP #MCPServer
