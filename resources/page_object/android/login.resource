*** Settings ***
Library    AppiumLibrary

*** Keywords ***

Dado que o aplicativo está aberto na tela de cadastro
    Wait Until Page Contains    Support
    Click Element    xpath=//android.view.View[@content-desc="Login"]
    Wait Until Page Contains    Login / Sign up Form
    Click Element    xpath=//android.widget.TextView[@text="Sign up"]
    Wait Until Page Contains    Confirm password
Quando o usuário preenche o email como "joao@example.com"
    Input Text    xpath=//android.widget.EditText[@content-desc="input-email"]    text=joao@example.com
E o usuário preenche a senha como "senhaSegura123"
    Input Password    xpath=//android.widget.EditText[@content-desc="input-password"]    text=senhaSegura123
E o usuário preenche o campo confirmando a senha
    Input Password    xpath=//android.widget.EditText[@content-desc="input-repeat-password"]    text=senhaSegura123
E o usuário clica no botão "SIGN"
    Click Element    //android.view.ViewGroup[@content-desc="button-SIGN UP"]/android.view.ViewGroup
Então a mensagem "You successfully signed up!" deve ser exibida
    Wait Until Page Contains    You successfully signed up!

Quando o usuário clica no botão "SIGN"
    E o usuário clica no botão "SIGN"
Então a mensagem de erro no email "Please enter a valid email address" deve ser exibida
    Wait Until Page Contains    Please enter a valid email address
E a mensagem de erro no password "Please enter at least 8 characters" deve ser exibida
    Wait Until Page Contains    Please enter at least 8 characters
E a mensagem de erro no confirm password "Please enter the same password" deve ser exibida
    Wait Until Page Contains    Please enter the same password
Dado que o aplicativo está aberto na tela de login
    Wait Until Page Contains    Support
    Click Element    xpath=//android.view.View[@content-desc="Login"]
    Wait Until Page Contains    Login / Sign up Form
E o usuário clica no botão "LOGI"
    Click Element    //android.view.ViewGroup[@content-desc="button-LOGIN"]/android.view.ViewGroup
Então a tela inicial deve ser exibida com a mensagem "You are logged in!"
    Wait Until Page Contains    You are logged in!
E o usuário preenche a senha com menos de 8 digitos
    Input Password    xpath=//android.widget.EditText[@content-desc="input-password"]    text=11
Então a mensagem de erro "Please enter at least 8 characters" deve ser exibida
    Wait Until Page Contains    Please enter at least 8 characters
Quando o usuário clica no botão "Forms"
    Click Element    xpath=//android.view.View[@content-desc="Forms"]
Então a tela de Form components deve ser exibida
    Wait Until Page Contains    Form components