*** Settings ***
Library    AppiumLibrary
Resource    ./home.resource

*** Keywords ***

Dado que o usuário está na tela de Webview
    Home validation
    Click Element    xpath=//android.view.View[@content-desc="Webview"]
    Wait Until Page Contains Element    xpath=//android.view.View[@text="WebdriverIO"]    timeout=10s
Quando o usuário clica no menu hamburguer
    Click Element    xpath=//android.widget.Button[@text="Toggle navigation bar"]
    Wait Until Page Contains    API    timeout=10s
E seleciona a opção API
    Click Element    xpath=//android.view.View[@content-desc="API"]
Então deve ser redirecionado para a pagina com a documentação da API
    Wait Until Page Contains    Introduction    timeout=10s

E faz um swipe para baixo
    Sleep    0.2
    Swipe    ${654}    ${1880}    ${654}    ${1750}
    sleep    0.5
    ${positions}    Get Element Location    xpath=//android.view.View[@resource-id="ms-floating-button"]/android.view.View

    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Set Variable    ${positions}[x]
    ${offset_y}    Evaluate        ${positions}[y] - 2000
    Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}
E clica na opção "next Protocol Commands >>"
    Wait Until Page Contains    Protocol Commands »
    Click Element    xpath=//android.widget.TextView[@text="Protocol Commands »"]
Então deve ser redirecionado para a próxima pagina "Protocols"
    Wait Until Page Contains    Protocols