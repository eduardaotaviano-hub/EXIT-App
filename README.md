# EXIT — Aplicativo de gerenciamento de eventos

Projeto acadêmico desenvolvido com **Qt Creator**, **C++**, **Qt Quick/QML** e **SQLite**, utilizando o módulo **Qt Quick LocalStorage** para persistência local dos dados.

## Sobre o projeto

EXIT é um protótipo de aplicativo desktop para criação e gerenciamento de eventos. A interface foi construída em QML e os dados são armazenados localmente em um banco SQLite.

## Tecnologias

- C++
- Qt 6 / Qt Quick
- QML
- SQLite
- Qt Quick LocalStorage
- CMake

## Funcionalidades

- Criar eventos com título, local e data.
- Consultar e listar eventos armazenados.
- Editar título, local e data de um evento existente.
- Excluir eventos individualmente, com confirmação.
- Manter as alterações no banco local após fechar e reabrir o aplicativo.

## Banco de dados e SQL

O banco é aberto com `LocalStorage.openDatabaseSync()` usando o identificador `ExitDB`.

A tabela `eventos` contém os seguintes campos:

| Campo | Tipo | Finalidade |
|---|---|---|
| `id` | INTEGER PRIMARY KEY AUTOINCREMENT | Identificador único do evento |
| `titulo` | TEXT | Nome do evento |
| `local` | TEXT | Local do evento |
| `dataEvento` | TEXT | Data/horário informado |

Principais operações SQL utilizadas no projeto:

```sql
CREATE TABLE IF NOT EXISTS eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    local TEXT,
    dataEvento TEXT
);

INSERT INTO eventos (titulo, local, dataEvento)
VALUES (?, ?, ?);

SELECT id, titulo, local, dataEvento
FROM eventos
ORDER BY id DESC;

UPDATE eventos
SET titulo = ?, local = ?, dataEvento = ?
WHERE id = ?;

DELETE FROM eventos
WHERE id = ?;
```

As operações de inserção, atualização e exclusão utilizam parâmetros (`?`). A atualização e a exclusão identificam o registro pelo `id`, evitando alterar ou remover os demais eventos.

## Operações CRUD demonstradas

- **Create:** criação de eventos (`INSERT`).
- **Read:** consulta e listagem (`SELECT`).
- **Update:** edição de eventos (`UPDATE`).
- **Delete:** exclusão individual de eventos (`DELETE`).

## Estrutura do projeto

- `main.cpp`: inicialização da aplicação Qt.
- `Main.qml`: janela principal e navegação entre telas.
- `Perfil.qml`: abertura do banco, criação da tabela, consultas, listagem e integração das ações dos eventos.
- `CriarRole.qml`: formulário e gravação de novos eventos.
- `EditarRole.qml`: formulário e atualização de eventos existentes.
- `CardEvento.qml`: componente visual dos cartões de eventos e ações disponíveis.
- `EventoCriado.qml`: tela de confirmação.
- `Configuracoes.qml`: tela de configurações.
- `fotos/`: imagens utilizadas pela interface.

## Como abrir no Qt Creator

1. Instale o Qt 6 e os componentes de desenvolvimento compatíveis com seu sistema.
2. Abra o arquivo `CMakeLists.txt` no Qt Creator.
3. Selecione um kit Desktop compatível (o projeto foi testado com **Desktop Qt 6.9.2 MinGW 64-bit**).
4. Configure o projeto, compile e execute.

## Testes realizados

No ambiente de desenvolvimento, foram realizados testes de compilação e execução, além de testes manuais de criação, consulta, edição e exclusão de eventos. Também foi verificado que as alterações persistem após fechar e reabrir o aplicativo.

## Limitações conhecidas

- O banco SQLite é local ao aplicativo/usuário; não há sincronização em nuvem.
- A tela inicial possui campos de e-mail e senha, mas a versão atual não implementa autenticação real.
- O formulário possui um campo de descrição, mas essa informação não é armazenada na tabela atual.
- O projeto é um protótipo acadêmico; a interface e as funcionalidades podem ser ampliadas em versões futuras.
