*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/login.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenário 01: Usuário realiza cadastro com sucesso
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha como "senhaSegura123"
    E o usuário preenche o campo confirmando a senha
    E o usuário clica no botão "SIGN"
    Então a mensagem "You successfully signed up!" deve ser exibida

Cenário 02: Usuário tenta se cadastrar sem preencher os campos
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário clica no botão "SIGN"
    Então a mensagem de erro no email "Please enter a valid email address" deve ser exibida
    E a mensagem de erro no password "Please enter at least 8 characters" deve ser exibida
    E a mensagem de erro no confirm password "Please enter the same password" deve ser exibida

Cenário 03: Usuário faz login com sucesso
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha como "senhaSegura123"
    E o usuário clica no botão "LOGI"
    Então a tela inicial deve ser exibida com a mensagem "You are logged in!"

Cenário 04: Usuário tenta login com senha errada
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha com menos de 8 digitos
    E o usuário clica no botão "LOGI"
    Então a mensagem de erro "Please enter at least 8 characters" deve ser exibida

Cenário 05: Navegar da tela de login para tela de cadastro
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário clica no botão "Forms"
    Então a tela de Form components deve ser exibida