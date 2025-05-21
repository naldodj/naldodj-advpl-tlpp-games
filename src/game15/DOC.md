
# Game15 - Projeto em ADVPL + TL++

Este projeto implementa o clássico jogo **15 peças** usando a linguagem **ADVPL** com a extensão **TL++** (TOTVS TL++), adotando o padrão de arquitetura **MVC** (Model-View-Controller) para separação de responsabilidades.

## 📁 Estrutura dos Arquivos

### 🔁 game15.tlpp
Arquivo principal responsável por iniciar o jogo e interligar as camadas MVC.

📄 [Visualizar no GitHub](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/game15/game15.tlpp)  
📥 [Download raw](https://raw.githubusercontent.com/naldodj/naldodj-advpl-tlpp-games/refs/heads/main/src/game15/game15.tlpp)

---

## 🧠 Arquitetura MVC

O projeto está organizado de acordo com o padrão **Model-View-Controller**:

```

/src/game15/
│
├── game15.tlpp              # Inicializador do jogo
└── /mvc
├── game15.controller.tlpp  # Camada de controle
├── game15.model.tlpp       # Camada de dados/lógica
└── game15.view\.tlpp        # Camada de apresentação

```

---

### 📦 Model - [game15.model.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/game15/mvc/game15.model.tlpp)

Responsável por manter a lógica do jogo, incluindo:

- Geração e embaralhamento do tabuleiro
- Verificação de jogadas válidas
- Checagem da condição de vitória

📥 [Download raw](https://raw.githubusercontent.com/naldodj/naldodj-advpl-tlpp-games/refs/heads/main/src/game15/mvc/game15.model.tlpp)

---

### 👁 View - [game15.view.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/game15/mvc/game15.view.tlpp)

Responsável pela interface com o usuário:

- Exibição do tabuleiro no console
- Atualização visual após cada jogada
- Mensagens de vitória e interação

📥 [Download raw](https://raw.githubusercontent.com/naldodj/naldodj-advpl-tlpp-games/refs/heads/main/src/game15/mvc/game15.view.tlpp)

---

### 🎮 Controller - [game15.controller.tlpp](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/game15/mvc/game15.controller.tlpp)

Responsável por controlar o fluxo do jogo:

- Captura e interpretação das entradas do jogador
- Coordenação entre Model e View
- Lógica de controle de jogadas

📥 [Download raw](https://raw.githubusercontent.com/naldodj/naldodj-advpl-tlpp-games/refs/heads/main/src/game15/mvc/game15.controller.tlpp)

---

## 📖 Documentação Adicional

Consulte o arquivo [`README.md`](https://github.com/naldodj/naldodj-advpl-tlpp-games/blob/main/src/game15/README.md) dentro da pasta `/src/game15/` para instruções de execução, requisitos e detalhes adicionais sobre o projeto.

---

## 🛠 Tecnologias Utilizadas

- **ADVPL** - Linguagem nativa do ERP TOTVS Protheus
- **TL++** - Extensão da TOTVS para desenvolvimento orientado a objetos
- **TOTVS MVC Pattern** - Padrão de desenvolvimento modular para projetos em ADVPL

---

## 🤝 Contribuições

Sinta-se livre para contribuir com melhorias, correções ou novas ideias!

---

## 📄 Licença

Este projeto está licenciado sob os termos da [MIT License](https://opensource.org/licenses/MIT).
