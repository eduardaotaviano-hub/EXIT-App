# EXIT — Aplicativo de organização de eventos

O **EXIT** é um aplicativo desktop desenvolvido como projeto acadêmico, com o objetivo de facilitar a criação e o gerenciamento de eventos e encontros entre pessoas.

O projeto foi desenvolvido utilizando **C++, Qt Quick (QML) e SQLite**, explorando a integração entre interface gráfica e armazenamento local de dados.

## Funcionalidades

- **Cadastro de eventos:** criação de eventos com nome, local e data.
- **Visualização:** listagem dos eventos cadastrados.
- **Edição:** atualização das informações de eventos existentes.
- **Exclusão:** remoção de eventos com confirmação da ação.
- **Persistência de dados:** armazenamento local utilizando SQLite.

## Tecnologias utilizadas

- C++
- Qt 6
- Qt Quick / QML
- SQLite
- CMake
- Qt Creator

## Capturas de tela

### Perfil e listagem de eventos

![Tela de perfil](Captura%20de%20tela%202026-11-02%20192557.png)

### Criação de eventos

![Tela de criação](Captura%20de%20tela%202026-11-02%20192732.png)

### Confirmação de cadastro

![Evento criado](Captura%20de%20tela%202026-11-02%20192632.png)

### Edição de eventos

![Tela de edição](Captura%20de%20tela%202026-11-02%20192813.png)

## Estrutura do projeto

| Arquivo | Responsabilidade |
|---|---|
| `main.cpp` | Inicialização da aplicação |
| `Main.qml` | Estrutura principal da interface |
| `Perfil.qml` | Tela de perfil e listagem de eventos |
| `CriarRole.qml` | Formulário de criação |
| `EditarRole.qml` | Formulário de edição |
| `EventoCriado.qml` | Tela de confirmação |
| `CardEvento.qml` | Componente visual dos eventos |
| `Configuracoes.qml` | Tela de configurações |
| `CMakeLists.txt` | Configuração de compilação |

## Banco de dados e operações CRUD

O projeto utiliza SQLite por meio do Qt Quick LocalStorage para persistir os eventos localmente.

As operações CRUD implementadas são:

- **Create:** inserção de novos eventos.
- **Read:** consulta e exibição dos eventos cadastrados.
- **Update:** atualização dos dados de um evento.
- **Delete:** exclusão de eventos específicos.

A persistência foi testada durante a execução local da aplicação, inclusive após fechar e abrir o programa novamente.

## Como executar

1. Instale o Qt Creator e o Qt 6.
2. Abra o projeto pelo arquivo `CMakeLists.txt`.
3. Selecione um kit Desktop compatível com a instalação.
4. Configure o projeto e aguarde a compilação.
5. Execute a aplicação pelo Qt Creator.

## Aprendizados e conhecimentos aplicados

O desenvolvimento do EXIT proporcionou experiência prática com:

- Desenvolvimento de interfaces utilizando QML.
- Integração entre C++ e Qt.
- Manipulação de banco de dados SQLite.
- Implementação das operações CRUD.
- Organização de componentes e telas.
- Persistência e gerenciamento de dados.
- Compilação e execução de aplicações desktop.

---

**Projeto acadêmico desenvolvido para fins de aprendizado e demonstração de conhecimentos em desenvolvimento de software.**
