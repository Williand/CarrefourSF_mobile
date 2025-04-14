*** Settings ***
Library    AppiumLibrary

*** Keywords ***

Dado que o usuário está na tela de swipe
    Wait Until Page Contains    Support
    Click Element    xpath=//android.view.View[@content-desc="Swipe"]
    Wait Until Page Contains    Swipe horizontal
Quando o usuário clica para fazer swipe para a esquerda na tela
    ${positions}    Get Element Location    xpath=(//android.view.ViewGroup[@content-desc="card"])[2]

    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Evaluate        ${positions}[x] - 1000
    ${offset_y}    Set Variable    ${positions}[y]
    Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}
Então a tela deve realizar swipe e deve aparecer o próximo item "Great Community"
    Wait Until Page Contains    GREAT COMMUNITY