*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/forms.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenário 07: Validação de Form
    Dado que o usuário está na tela de forms
    Quando o usuário escreve "Ótimo app, parabéns!" no campo Input field:
    E o usuário clica no botão de switch
    E Seleciona a opção "Appium is awesome" no Dropdown
    Então a mensagem deve ser exibida no campo "You have typed"
    E o switch deve ter mudado
    E o Dropdown deve exibir a opção escolhida