# 🎮 naldodj-advpl-tlpp-games

> **Aprender AdvPL/TLPP não precisa significar passar o dia inteiro olhando para cadastro, browse, pedido e relatório. Às vezes, a melhor aula começa com um jogo.** 😎

Este repositório reúne experimentos, jogos e integrações desenvolvidos em **AdvPL/TLPP para o ecossistema TOTVS Protheus** com um objetivo que vai além da diversão: usar problemas visualmente interessantes e fáceis de compreender para explorar técnicas reais de desenvolvimento.

Aqui você encontra Sudoku, Game 15, Sapureca, arquitetura MVC, orientação a objetos, namespaces, manipulação de interface, lógica de estado, geração de testes e até integração com **Harbour, Python e MCP**.

Ou seja:

**é um playground para aprender programação no Protheus sem parecer que você está estudando.** 🎯

---

## 🧠 Por que jogos?

Jogos são excelentes exercícios de programação porque obrigam o desenvolvedor a resolver praticamente os mesmos problemas encontrados em sistemas corporativos:

- representar e controlar estado;
- validar entradas;
- reagir a eventos;
- atualizar interfaces;
- dividir responsabilidades;
- criar regras de negócio;
- lidar com estruturas de dados;
- controlar ciclo de vida de objetos;
- testar cenários;
- pensar em desempenho;
- organizar código para que ele continue compreensível depois que cresce.

A grande diferença é que, em vez de descobrir que a regra funcionou porque um campo da `SC6` mudou...

você vê uma peça se mover, um tabuleiro ser montado ou um Sudoku ser resolvido. 😄

---

# 🚀 O que existe neste repositório

Atualmente os fontes principais estão organizados em módulos independentes dentro de `src/`:

```text
src/
├── game15/
├── sudoku/
├── sapureca/
├── mcp/
└── tools/
```

Cada projeto serve como laboratório para técnicas diferentes.

---

## 🧩 Game 15

O clássico quebra-cabeça deslizante de 15 peças virou um excelente laboratório de arquitetura TLPP.

```text
src/game15/
├── game15.tlpp
├── mvc/
│   ├── game15.controller.tlpp
│   ├── game15.model.tlpp
│   └── game15.view.tlpp
├── resources/
├── DOC.md
└── README.md
```

### O que estudar aqui

- separação **Model / View / Controller**;
- encapsulamento da lógica do jogo;
- ciclo de vida de objetos;
- controle de execução através do Controller;
- eventos de interface;
- organização de projetos TLPP maiores;
- separação entre ponto de entrada e implementação;
- reutilização de componentes.

O ponto de entrada é propositalmente pequeno:

```tlpp
function u_Game15Run()
return(game15.Game15():Run())
```

A função pública não precisa conhecer os detalhes do jogo. Ela apenas entrega a responsabilidade para a classe apropriada.

Esse pequeno detalhe ensina uma regra extremamente útil em sistemas reais:

> **uma função de entrada deveria iniciar um processo, não conter o processo inteiro.**

---

## 🔢 Sudoku

Sudoku é provavelmente o melhor laboratório do repositório para estudar **estado, validação, algoritmos, MVC e testes**.

```text
src/sudoku/
├── sudoku.tlpp
└── mvc/
    ├── sudoku.controller.tlpp
    ├── sudoku.model.tlpp
    └── sudoku.view.tlpp
```

Além da execução normal do jogo, existe suporte à execução de testes e geração de tabuleiros em HTML.

```tlpp
procedure u_SudokuRunTests(
    nTests as numeric,
    lHTMLTable as logical,
    lThemeIsDark as logical
)
```

Isso transforma o jogo em algo ainda mais interessante didaticamente: não existe apenas a interface visual; a lógica pode ser exercitada por caminhos alternativos.

### O que estudar aqui

- geração e manipulação de matrizes;
- regras e validações complexas;
- separação da lógica visual da lógica do domínio;
- parâmetros opcionais;
- valores default;
- tipagem TLPP;
- testes automatizados/semiautomatizados;
- geração dinâmica de HTML;
- gerenciamento explícito de objetos;
- controle de múltiplas partidas;
- preservação de estado entre execuções.

Há também um detalhe interessante no fluxo de nova partida: o Controller pode solicitar uma nova execução mantendo determinadas opções do jogo.

Isso permite estudar uma ideia muito comum em sistemas corporativos:

**estado de sessão não precisa significar variável global.**

---

## 🐸 Sapureca

Sim, existe um projeto chamado **Sapureca**. 😄

E justamente por isso ele cumpre muito bem uma das propostas deste repositório: experimentar conceitos técnicos em algo que seja visual, curioso e divertido.

A estrutura também segue MVC:

```text
src/sapureca/
├── sapureca.tlpp
├── mvc/
│   ├── sapureca.controller.tlpp
│   ├── sapureca.model.tlpp
│   └── sapureca.view.tlpp
└── resources/
```

### O que estudar aqui

- interfaces mais ricas;
- coordenação entre Controller, Model e View;
- uso de resources;
- eventos;
- posicionamento e atualização de componentes;
- construção de aplicações interativas em TLPP.

É também um bom exemplo para comparar com Game15 e Sudoku e observar como **a mesma arquitetura pode servir problemas completamente diferentes**.

---

# 🤖 MCP + TLPP + Harbour + Python

Agora a brincadeira fica um pouco mais séria.

O diretório `src/mcp` demonstra a exposição dos jogos através de um servidor MCP.

O fluxo experimental conecta diferentes tecnologias:

```text
Python
   ↓
STDIN / Harbour
   ↓
MCP Server
   ↓
TLPP / Protheus
   ↓
Game15 / Sudoku
```

O servidor registra ferramentas como:

```tlpp
oTMCPServer:AddTool("open_game15", ...)
oTMCPServer:AddTool("open_sudoku", ...)
oTMCPServer:AddTool("open_sudoku_test", ...)
```

Aqui os jogos deixam de ser apenas jogos e passam a ser **ações invocáveis por outra aplicação**.

### O que estudar aqui

- integração entre linguagens;
- comunicação entre processos;
- JSON;
- callbacks;
- codeblocks;
- descoberta dinâmica de classes;
- execução indireta de funções;
- construção de ferramentas MCP;
- automação do Protheus através de agentes externos;
- arquitetura extensível orientada a ferramentas.

É um ótimo exemplo de como um projeto aparentemente simples pode ser usado para experimentar conceitos modernos sem precisar arriscar um ambiente produtivo.

---

# 🏗️ Arquitetura: MVC sem virar religião

Um dos padrões mais evidentes do repositório é a separação em:

```text
Model
View
Controller
```

Mas o objetivo não é usar MVC porque alguém disse que é "bonito".

Nos jogos ele ajuda a visualizar claramente as responsabilidades.

### Model

Cuida do **estado e das regras**.

Exemplos:

- posição das peças;
- números do Sudoku;
- movimentos válidos;
- estado atual da partida;
- regras de vitória.

### View

Cuida da **representação visual**.

Exemplos:

- janelas;
- botões;
- cores;
- posicionamento;
- atualização da interface.

### Controller

Coordena o fluxo entre usuário, Model e View.

```text
Usuário
   ↓
View
   ↓
Controller
   ↓
Model
   ↓
Controller
   ↓
View
```

Quando essa separação funciona em um jogo, fica muito mais fácil perceber como aplicar a mesma ideia em:

- rotinas administrativas;
- processos industriais;
- integrações;
- APIs;
- relatórios complexos;
- ferramentas internas.

---

# ✍️ Estilo de codificação

O repositório também pode ser usado para estudar um estilo consistente de escrita em AdvPL/TLPP.

## Tipagem explícita

Sempre que possível, os tipos fazem parte do código:

```tlpp
local cSudokuHTML as character
local nTest as numeric
local lRun as logical
local oController as object
```

Isso melhora leitura, manutenção e capacidade de detectar erros antes da execução.

---

## Parâmetros declarados e defaults claros

Exemplo:

```tlpp
paramtype 1 var lSudokuKeepLevelOption as logical optional default .F.
paramtype 2 var nSudokuLastLevel as numeric optional default 0
```

O contrato da função fica explícito.

Quem lê consegue descobrir rapidamente:

- o tipo esperado;
- se o parâmetro é opcional;
- qual é o valor padrão.

---

## Namespaces

Os projetos usam namespaces para evitar transformar o RPO em uma guerra mundial de nomes de funções.

```tlpp
namespace sudoku
using namespace dna.tech
using namespace naldodj.games
```

Em projetos grandes isso deixa de ser estética e passa a ser sobrevivência. 😅

---

## Classes pequenas na entrada, responsabilidade grande nos componentes

Veja novamente o Game15:

```tlpp
oController:=Game15Controller():New()

lRun:=oController:CanExecute()

if (lRun)
    lRun:=oController:Activate()
endif
```

A intenção do código é fácil de entender mesmo sem conhecer toda a implementação.

Isso é importante.

Código bom não é apenas código que funciona.

**Código bom consegue explicar o que está fazendo.**

---

## Liberação explícita de objetos

Os exemplos também chamam atenção para ciclo de vida:

```tlpp
MsObjects():FreeObjects(@oController)
```

ou:

```tlpp
FreeObj(@oController)
```

É uma ótima oportunidade para estudar gerenciamento de objetos no ambiente Protheus e entender por que "deixar o garbage collector resolver" nem sempre deveria ser a única estratégia.

---

# 🎓 Trilha sugerida de aprendizado

Se a ideia é estudar o repositório e não apenas executar os jogos, esta ordem funciona bem:

### Nível 1 — Execute

Compile e rode os jogos.

Primeiro veja **o que o código faz**.

### Nível 2 — Ache o ponto de entrada

Procure funções como:

```text
u_Game15Run
u_SudokuRun
```

Veja como elas delegam responsabilidade.

### Nível 3 — Leia o Controller

Descubra quem inicia a interface, reage às ações e conversa com o Model.

### Nível 4 — Leia o Model

Agora procure a regra do jogo.

Pergunte:

> "Se eu removesse completamente a interface, ainda conseguiria jogar usando apenas esse código?"

Quanto mais próxima de **sim** for a resposta, melhor está a separação.

### Nível 5 — Leia a View

Veja como estado vira interface.

### Nível 6 — Quebre alguma coisa 😈

Mude regras.

Troque tamanho do tabuleiro.

Adicione botões.

Crie uma nova dificuldade.

Faça o jogo trapacear.

Depois descubra onde deveria colocar a alteração corretamente.

Esse exercício ensina arquitetura muito mais rápido do que decorar diagramas UML.

### Nível 7 — Crie seu próprio jogo

Escolha algo simples:

- jogo da velha;
- memória;
- campo minado;
- mastermind;
- batalha naval;
- 2048;
- damas.

Copie **a arquitetura**, não o código.

Se você conseguir construir outro jogo respeitando Model, View e Controller, provavelmente entendeu o padrão.

---

# 🧪 Ideias de exercícios

Quer transformar este repositório em uma espécie de curso prático?

Experimente:

1. adicionar contador de movimentos ao Game15;
2. criar ranking por tempo;
3. salvar preferências do Sudoku;
4. implementar Undo/Redo;
5. gerar partidas reproduzíveis usando uma seed;
6. criar testes que validem milhares de tabuleiros automaticamente;
7. adicionar logs estruturados;
8. criar novas ferramentas MCP;
9. executar um jogo a partir de Python;
10. implementar outro jogo seguindo a mesma arquitetura.

Cada exercício parece brincadeira.

Mas, por baixo, você estará praticando exatamente os mesmos conceitos usados em aplicações corporativas.

---

# 💡 O principal aprendizado

Este repositório tenta demonstrar uma ideia simples:

> **AdvPL/TLPP não precisa ser estudado apenas através de ERP.**

Quando removemos pedido de venda, nota fiscal, financeiro e tabela do caminho, sobra aquilo que realmente interessa para aprender programação:

```text
problema
   ↓
modelo
   ↓
algoritmo
   ↓
arquitetura
   ↓
interface
   ↓
teste
   ↓
refatoração
```

Depois de aprender isso com um Sudoku ou um quebra-cabeça, aplicar o mesmo raciocínio a uma rotina empresarial fica muito mais natural.

---

# 🎮 Então este repositório é sobre jogos?

Sim.

E não. 😄

Os jogos são apenas o cenário.

O verdadeiro assunto aqui é:

**programação, arquitetura, experimentação e aprendizado dentro do ecossistema AdvPL/TLPP.**

Se você aprender alguma coisa enquanto tenta bater seu próprio recorde no Game15...

missão cumprida. 🏆

---

## 🤝 Contribuições

Achou um bug?

Quer melhorar algum jogo?

Quer criar outro experimento maluco em TLPP?

Pull Requests são bem-vindos.

Especialmente se a ideia começar com:

> "Será que dá para fazer isso no Protheus?"

Provavelmente essa é exatamente a pergunta certa para este repositório. 😎

---

## ⭐ Apoie o projeto

Se este repositório ajudou você a descobrir alguma técnica nova, aprender TLPP ou simplesmente perceber que Protheus também pode servir para algo além de boleto e pedido de venda, considere deixar uma ⭐.

E, principalmente:

**fork, explore, quebre, conserte e aprenda.**

É para isso que este playground existe. 🎮🚀
