# EXIT — Aplicativo de gerenciamento de eventos

Projeto acadêmico desenvolvido com **Qt Creator**, **Qt Quick/QML** e **SQLite**, utilizando o módulo **Qt Quick LocalStorage** para armazenamento local.

## Sobre o projeto

EXIT é um protótipo de aplicativo desktop para criação e visualização de eventos. A interface foi construída em QML e os dados dos eventos são armazenados localmente em um banco SQLite.

## Tecnologias

- C++
- Qt 6 / Qt Quick
- QML
- SQLite
- Qt Quick LocalStorage
- CMake

## Funcionalidades presentes no código

- Criação da tabela `eventos`, caso ainda não exista.
- Inserção de eventos com título, local e data.
- Consulta e exibição dos eventos armazenados.
- Contagem de registros para inserir dados de demonstração quando a tabela está vazia.
- Exclusão de registros e limpeza de eventos sem título.

## Implementação SQL

O banco é aberto com `LocalStorage.openDatabaseSync()` usando o identificador `ExitDB`.

A tabela criada no código contém:

| Campo | Tipo | Finalidade |
|---|---|---|
| `id` | INTEGER PRIMARY KEY AUTOINCREMENT | Identificador do evento |
| `titulo` | TEXT | Nome do evento |
| `local` | TEXT | Local do evento |
| `dataEvento` | TEXT | Data/horário informado |

Exemplos de comandos SQL encontrados no projeto:

```sql
CREATE TABLE IF NOT EXISTS eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    local TEXT,
    dataEvento TEXT
);

INSERT INTO eventos (titulo, local, dataEvento)
VALUES (?, ?, ?);

SELECT titulo, local, dataEvento FROM eventos;

DELETE FROM eventos;
```

As inserções utilizam parâmetros (`?`) para enviar os valores separadamente da instrução SQL.

## Estrutura do projeto

- `main.cpp`: inicialização da aplicação Qt.
- `Main.qml`: janela principal e navegação entre telas.
- `Perfil.qml`: abertura do banco, criação da tabela, consultas e listagem dos eventos.
- `CriarRole.qml`: formulário e gravação de novos eventos.
- `CardEvento.qml`: componente visual para exibir cada evento.
- `EventoCriado.qml`: tela de confirmação.
- `Configuracoes.qml`: tela de configurações.
- `fotos/`: imagens utilizadas pela interface.

## Como abrir no Qt Creator

1. Instale uma versão compatível do Qt 6 (o projeto original foi configurado com Qt 6.8).
2. Abra o arquivo `CMakeLists.txt` no Qt Creator.
3. Selecione um kit Desktop compatível.
4. Configure e compile o projeto.

## Observações sobre o escopo

Este repositório apresenta o código-fonte de um projeto acadêmico. A compilação em outros computadores ainda precisa ser validada.

O banco SQLite é local ao aplicativo/usuário e é criado pelo LocalStorage em tempo de execução. A tela inicial possui campos de e-mail e senha, mas a versão atual não implementa autenticação real. O formulário também possui um campo de descrição, porém a versão atual não o grava na tabela.
