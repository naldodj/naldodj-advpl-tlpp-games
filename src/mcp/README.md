🧠 MCP no Protheus com base no Harbour: integração prática com Python e TL++ 🎮

Você sabia que é possível executar um servidor MCP (Multi-Code Processor) dentro do ecossistema TOTVS Protheus, utilizando recursos herdados diretamente do Harbour?

Acabo de publicar um experimento prático que demonstra isso com a execução do jogo Sudoku, onde o servidor MCP é escrito em Harbour, recebe comandos via stdin, envia para o servidor MCP no Protheus TL++. Pode testá-los utilizando scripts em Python.

🔍 O que este exemplo mostra:

Uma interface STDIN escrita em Harbour para interpretação dos comandos;

Um servidor MCP escrito em TLPP que responde aos comandos;

A capacidade de acionar ferramentas ou jogos dinamicamente com o uso de TL++;

Dois scripts em Python  que se comunicam com via STDIN com o Harbour que envia a requisição para  MCP Protheus que, por fim, executa o comandos:
  - [dna.tech.games.list.tools.py]([https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.list.tools.json]
  - [dna.tech.games.call.tool.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.call.tool.py)

Um arquivo [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp) que inicia o servidor MCP

🛠️ Arquivos envolvidos:
🧩 Servidor MCP: [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp)
🧩 Interprete STDIN: [hb_totvs_mcp.prg](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/hb/mcp/hb_totvs_mcp.prg)

🐍 Scripts Python: 
  - [dna.tech.games.list.tools.py]([https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.list.tools.json]
  - [dna.tech.games.call.tool.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.call.tool.py)

🧠 Definição da ferramenta TL++: [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp)

Esse modelo pode ser expandido para chamadas seguras, autenticação, controle de acesso, testes automatizados e muito mais — tudo isso com o poder de um servidor leve, interpretado e extensível.

🔗 Acesse o repositório completo:
[naldodj-advpl-tlpp-games](https://github.com/naldodj/naldodj-advpl-tlpp-games)

## Listando as Ferramentas
https://github.com/user-attachments/assets/12ba70ab-a939-4c82-85de-44a44df110f2

---

## Executando as Ferramentas
https://github.com/user-attachments/assets/2424b532-5146-44c4-9024-4d6dab59b45a

---

#TOTVS #Protheus  #HarbourLang #ADVPL #DesenvolvimentoERP #PythonAutomation  #OpenSource #GameDev #TLPP #MCPServer
