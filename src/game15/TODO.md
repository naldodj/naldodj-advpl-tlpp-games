## ✅ TODO: Refatorar para MVC 100% aderente

### 🔍 **Problemas Identificados**

* ⚠️ **Controller muito fino:**
  O arquivo `game15.controller.tlpp` está funcionando apenas como um repassador de chamadas do View para o Model, sem aplicar regras de controle, validações ou lógica intermediária.

* ⚠️ **View acessando diretamente o Model:**
  O arquivo `game15.view.tlpp` faz chamadas diretas ao Model, como `::oModel:GetBoard()`, o que **quebra o padrão MVC**, comprometendo a separação de responsabilidades.

---

### 🔧 **Ajustes Necessários**

#### 1️⃣ **Reforçar o Controller**

* ✅ Mover toda a lógica de interação e regras de negócio para dentro do Controller.
* ✅ O Controller deve ser o **único responsável por interagir com o Model e a View**.
* ✅ Toda decisão, validação e atualização deve acontecer dentro do Controller.

#### 2️⃣ **Isolar a View**

* ✅ A View deve ser totalmente dependente do Controller, não do Model.
* ✅ A View **não deve ter conhecimento direto** do Model.
* ✅ A View deve:

  * Solicitar dados e ações **exclusivamente via Controller**.
  * Receber do Controller todos os dados prontos para exibição.
  * Apenas capturar entrada do usuário e repassar ao Controller.

---

### 🔁 **Novo Fluxo Correto - Padrão MVC**

| **Evento**                    | **De → Para**          | **Ação**                                                                       |
| ----------------------------- | ---------------------- | ------------------------------------------------------------------------------ |
| 🧑 Usuário faz um input       | **View → Controller**  | View chama `::oController:HandleInput(nInput)`                                 |
| 🔎 Validação e lógica         | **Controller → Model** | Controller valida (`::oModel:IsValidMove()`) e executa (`::oModel:MoveTile()`) |
| 🔄 Atualização de dados       | **Model → Controller** | Controller obtém dados atualizados (`::oModel:GetBoard()`)                     |
| 🖥️ Renderização da interface | **Controller → View**  | Controller chama `::oView:DisplayBoard(aBoard, nEmptyPos)`                     |

---

### ✍️ **Modificações Específicas na View**

* 🛠️ **Inicialização:**
  Receber o Controller como parâmetro e armazenar como referência interna (`::oController`).

* 🚫 **Remover acesso direto ao Model:**
  Eliminar chamadas como `::oModel:GetBoard()`. Todos os dados devem ser recebidos do Controller.

* 🔄 **Entrada do Usuário:**
  Quando capturar uma ação (ex.: movimento do jogador), deve repassar diretamente ao Controller via método como `::oController:HandleInput(nInput)`.

---

### 📜 **Resumo das Alterações**

| 🔥 **Item**            | 🚫 **Antes (Errado)**                     | ✅ **Depois (Correto)**                          |
| ---------------------- | ----------------------------------------- | ----------------------------------------------- |
| View acessa Model?     | ❌ Sim (`::oModel:GetBoard()`)             | ✅ Não (View recebe dados prontos do Controller) |
| Quem controla o fluxo? | ❌ View ou Model                           | ✅ Controller (orquestra tudo)                   |
| Input do usuário       | ❌ View processava diretamente             | ✅ View repassa ao Controller                    |
| Atualização da tela    | ❌ View buscava dados diretamente do Model | ✅ Controller fornece dados atualizados à View   |

---

### 🚀 **Vantagens da Correção**

* ✔ Separação clara de responsabilidades.
* ✔ Facilita testes unitários e automação.
* ✔ A View fica desacoplada da lógica de negócio.
* ✔ Manutenção e evolução do código ficam muito mais simples e seguras.

---
