🧠 MCP no Protheus com base no Harbour: integração prática com Python e TL++ 🎮

Você sabia que é possível executar um servidor MCP (Multi-Code Processor) dentro do ecossistema TOTVS Protheus, utilizando recursos herdados diretamente do Harbour?

![ChatGPT Image 29 de mai  de 2025, 09_44_47](https://github.com/user-attachments/assets/62e5eac2-132a-4047-a4d0-a24b7ceac390)

Acabo de publicar um experimento prático que demonstra isso com a execução dos jogos em TL++, onde um aplicativo Harbour recebe comandos via stdin, envia para o servidor MCP no Protheus TL++ que os executa. 

🔍 O que este exemplo mostra:

Uma interface STDIN escrita em Harbour para interpretação dos comandos;

Um servidor MCP escrito em TLPP que responde aos comandos;

A capacidade de acionar ferramentas ou jogos dinamicamente com o uso de TL++;

Dois scripts em Python  que se comunicam com via STDIN com o Harbour que envia a requisição para  MCP Protheus que, por fim, executa o comandos:
  - [dna.tech.games.list.tools.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.list.tools.json)
  - [dna.tech.games.call.tool.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.call.tool.py)

Um arquivo [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp) que inicia o servidor MCP

🛠️ Arquivos envolvidos:
🧩 Servidor MCP: [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp)
🧩 Interprete STDIN: [hb_totvs_mcp.prg](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/hb/mcp/hb_totvs_mcp.prg)
  - Referências
    - [FiveTech TMCPServer](https://forums.fivetechsupport.com/viewtopic.php?t=45579) 
    - [FiveTech vsCode MCP Suport](https://forums.fivetechsupport.com/viewtopic.php?p=279038&fbclid=IwY2xjawKlMM1leHRuA2FlbQIxMABicmlkETA2Mk4xd3g1dXkyN000NTREAR4fdh9gm-RjZTonmQbVevBSRp3TujM_kExu1lRq-L6FwnrxGBiS3fYNy_jWOA_aem_uMxpNJi83J9wa1ExWjcYNw#p279038)
    - [FiveTech Artificial Intelligence](https://forums.fivetechsupport.com/viewforum.php?f=38&sid=7cf26344253a8322ec414e65674777cd)
  
🐍 Scripts Python: 
  - [dna.tech.games.list.tools.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.list.tools.json)
  - [dna.tech.games.call.tool.py](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/py/dna.tech.games.call.tool.py)

🧠 Definição da ferramenta TL++: [dna.games.mcp.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/mcp/dna.games.mcp.tlpp)
  - referência: [FiveTech]()

Esse modelo pode ser expandido para chamadas seguras, autenticação, controle de acesso, testes automatizados e muito mais — tudo isso com o poder de um servidor leve, interpretado e extensível.

🔗 Acesse o repositório completo:
[naldodj-advpl-tlpp-games](https://github.com/naldodj/naldodj-advpl-tlpp-games)

## Listando as Ferramentas
https://github.com/user-attachments/assets/59807843-6f36-4a5f-b2fa-2720a050de16

---

## Executando as Ferramentas
https://github.com/user-attachments/assets/b5da5d5c-01a9-44b0-8b26-d389e8af3f4e

---

#TOTVS #Protheus  #HarbourLang #ADVPL #DesenvolvimentoERP #PythonAutomation  #OpenSource #GameDev #TLPP #MCPServer
