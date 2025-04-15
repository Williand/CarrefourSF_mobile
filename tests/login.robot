*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/login.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenario_01_Usuário_realiza_cadastro_com_sucesso
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha como "senhaSegura123"
    E o usuário preenche o campo confirmando a senha
    E o usuário clica no botão "SIGN"
    Então a mensagem "You successfully signed up!" deve ser exibida

Cenario_02_Usuario_tenta_se_cadastrar_sem_preencher_os_campos
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário clica no botão "SIGN"
    Então a mensagem de erro no email "Please enter a valid email address" deve ser exibida
    E a mensagem de erro no password "Please enter at least 8 characters" deve ser exibida
    E a mensagem de erro no confirm password "Please enter the same password" deve ser exibida

Cenario03_Usuario_faz_login_com_sucesso
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha como "senhaSegura123"
    E o usuário clica no botão "LOGI"
    Então a tela inicial deve ser exibida com a mensagem "You are logged in!"

Cenario_04_Usuario_tenta_login_com_senha_errada
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha com menos de 8 digitos
    E o usuário clica no botão "LOGI"
    Então a mensagem de erro "Please enter at least 8 characters" deve ser exibida

Cenario_05_Navegar_da_tela_de_login_para_tela_de_cadastro
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário clica no botão "Forms"
    Então a tela de Form components deve ser exibida