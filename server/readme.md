# 🎷💀 API - Gerenciamento de alunos e salas de aula

Esta API oferece endpoints para operações de criação, leitura, atualização e exclusão de registros, além de gerenciar associações entre diferentes entidades. Utiliza o **Prisma** para interações com o banco de dados e **Zod** para validação dos dados de entrada.

## 🚀 Configuração Inicial

### 📦 Instalação

1. Instale as dependências:

    ```bash
    yarn install
    ```

2. (Opcional) Crie um arquivo `.env` e configure as variáveis de ambiente `PORT` e as credenciais do banco de dados para o Prisma.

### 🖥️ Executando o Servidor

Para iniciar o servidor, execute:

```bash
yarn dev
```

O servidor será iniciado em `http://localhost:3000` por padrão ou de acordo com o valor da variável `PORT` definida no `.env`.

## 📂 Estrutura de Rotas

A API segue a estrutura REST com prefixo `/api` para os endpoints principais:

- `/api/entity`: Endpoints para gerenciar entidades (ex: student, classroom).

## 🛠️ Endpoints

### Entity Endpoints

#### ✏️ Criar Entidade

**POST** `/api/entity`

- **Descrição**: Adiciona uma nova entidade ao sistema.
- **Validação**: Valida os dados recebidos usando o esquema correspondente.
- **Parâmetros**:
  - **Body**: Objeto JSON conforme o esquema de validação.
- **Exemplo de Requisição**:

    ```json
    {
      "name": "Example Name",
      "email": "example@example.com",
      "$connect": {
        "relatedEntities": [1, 2]
      }
    }
    ```

- **Exemplo de Resposta**:

    ```json
    {
      "detail": "Registered successfully"
    }
    ```

#### 📜 Listar Entidades

**GET** `/api/entity`

- **Descrição**: Retorna uma lista paginada de entidades.
- **Query Parameters** (opcionais):
  - `page`: Número da página (default: 0).
  - `take`: Quantidade de itens por página (default: 10).
  - `filters`: JSON com critérios de filtro.
  - `orderBy`: JSON com critérios de ordenação.
- **Exemplo de Resposta**:

    ```json
    {
      "pagination": {
        "count": 50,
        "page": 0,
        "take": 10
      },
      "data": [
        {
          "id": 1,
          "name": "Example Name",
          "relatedEntities": [...]
        }
      ]
    }
    ```

    #### 🔍 **Utilizando os Parâmetros `filters` e `orderBy`**

    Os parâmetros `filters` e `orderBy` permitem personalizar a busca de entidades retornadas pela API, possibilitando a filtragem e a ordenação dos resultados.

    #### Parâmetro `filters`

    O parâmetro `filters` permite aplicar critérios de filtragem nos resultados. Ele deve ser passado como um objeto JSON, onde cada chave representa um campo da entidade e seu valor representa o critério desejado. 

    ##### Exemplos de Uso

    - **Equals**: Para buscar entidades que têm um valor exato em um campo específico, utilize a operação `equals`. Por exemplo, para buscar entidades com um nome específico:

    ```
    GET /api/entity?filters={"name":{"equals":"Example Name"}}
    ```

    - **Contains**: Para buscar entidades onde um campo contém uma substring, utilize a operação `contains`. Por exemplo, para buscar entidades onde o nome contém a palavra "Example":

    ```
    GET /api/entity?filters={"name":{"contains":"Example"}}
    ```

    #### Parâmetro `orderBy`

    O parâmetro `orderBy` é utilizado para definir a ordem dos resultados retornados. Também deve ser passado como um objeto JSON, onde a chave é o campo pelo qual você deseja ordenar e o valor indica a direção da ordenação (`asc` para ascendente e `desc` para descendente).

    ##### Exemplo de Uso

    Para ordenar os resultados pelo campo `createdAt` em ordem decrescente, você pode usar a seguinte requisição:

    ```
    GET /api/entity?orderBy={"createdAt":"desc"}
    ```

    ### 🔗 Exemplo Combinado

    Você pode combinar ambos os parâmetros na mesma requisição para filtrar e ordenar ao mesmo tempo. Por exemplo:

    ```
    GET /api/entity?filters={"name":{"contains":"Example"}}&orderBy={"createdAt":"asc"}
    ```

    Essa requisição retornará as entidades cujo nome contém "Example", ordenadas pela data de criação em ordem crescente.

#### 🔍 Buscar Entidade por ID

**GET** `/api/entity/:id`

- **Descrição**: Retorna os dados de uma entidade específica, incluindo as associações.
- **Parâmetros**:
  - `id`: ID da entidade.
- **Exemplo de Resposta**:

    ```json
    {
      "id": 1,
      "name": "Example Name",
      "relatedEntities": [...]
    }
    ```

#### ✏️ Atualizar Entidade

**PUT** `/api/entity/:id`

- **Descrição**: Atualiza as informações de uma entidade existente.
- **Validação**: Valida os dados recebidos usando o esquema correspondente.
- **Parâmetros**:
  - `id`: ID da entidade.
  - **Body**: Objeto JSON conforme o esquema de validação.
- **Exemplo de Requisição**:

    ```json
    {
      "name": "Updated Name",
      "$connect": { "relatedEntities": [3] },
      "$disconnect": { "relatedEntities": [1] }
    }
    ```

- **Exemplo de Resposta**:

    ```json
    {
      "detail": "Updated successfully"
    }
    ```

#### ❌ Deletar Entidade

**DELETE** `/api/entity/:id`

- **Descrição**: Remove uma entidade com base em seu ID.
- **Parâmetros**:
  - `id`: ID da entidade.
- **Exemplo de Resposta**:

    ```json
    {
      "detail": "Deleted successfully"
    }
    ```

## ⚠️ Validação de Dados e Tratamento de Erros

A API utiliza o **Zod** para validação dos dados de entrada. Nos endpoints de criação e atualização de entidades, são usados os esquemas correspondentes. Caso os dados sejam inválidos, a API retorna um erro `400 Bad Request` com detalhes sobre a validação.

### ❗ Erros Comuns

- **400 Bad Request**: Dados de entrada inválidos ou registro não encontrado.
- **500 Internal Server Error**: Erro interno do servidor; consulte os logs para mais informações.

---

Esta documentação cobre a configuração inicial, estrutura dos endpoints e exemplos de uso. Para mais detalhes sobre **Prisma** e **Zod**, consulte as documentações oficiais dessas ferramentas.
