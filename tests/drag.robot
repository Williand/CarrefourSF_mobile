*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/drag.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenario_10_Drag_an_drop_com_sucesso
    Dado que o usuário está na tela de Drag
    Quando o usuário completa o Drag and Drop
    Então deve aparecer a mensagem de "Congratulations"