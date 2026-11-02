cmake_minimum_required(VERSION 3.16)

project(EXIT VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appEXIT
    main.cpp
)

qt_add_qml_module(appEXIT
    URI Multimidia
    VERSION 1.0
    QML_FILES
        Main.qml
        Perfil.qml
        CriarRole.qml
        EventoCriado.qml
        Configuracoes.qml
        CardEvento.qml
        EditarRole.qml
    RESOURCES
        fotos/dog.jpg
        fotos/pessoa.png
)

target_link_libraries(appEXIT
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appEXIT
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
