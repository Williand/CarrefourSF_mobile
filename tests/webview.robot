*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/webview.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenario_08_Acessar_menu_de_API_da_pagina_Webview
    Dado que o usuário está na tela de Webview
    Quando o usuário clica no menu hamburguer
    E seleciona a opção API
    Então deve ser redirecionado para a pagina com a documentação da API

Cenario_09_Acessar_Protocols_da_página_Webview
    Dado que o usuário está na tela de Webview
    Quando o usuário clica no menu hamburguer
    E seleciona a opção API
    E faz um swipe para baixo
    E clica na opção "next Protocol Commands >>"
    Então deve ser redirecionado para a próxima pagina "Protocols"