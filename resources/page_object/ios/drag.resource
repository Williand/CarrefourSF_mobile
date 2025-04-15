*** Settings ***
Library     AppiumLibrary
Resource    ./home.resource

*** Keywords ***

Dado que o usuário está na tela de Drag
    Home validation
    Click Element    xpath=//android.view.View[@content-desc="Drag"]
    Wait Until Page Contains    Drag and Drop
Quando o usuário completa o Drag and Drop
    @{POSICOES}  Create List  l1    c1    r1    l2    c2    r2    l3    c3    r3
    FOR    ${posicao}    IN    @{POSICOES}
        ${drag_xpath}    Set Variable    //android.view.ViewGroup[@content-desc="drag-${posicao}"]/android.widget.ImageView
        ${drop_xpath}    Set Variable    //android.view.ViewGroup[@content-desc="drop-${posicao}"]/android.view.ViewGroup
        Drag And Drop    ${drag_xpath}    ${drop_xpath}
    END
Então deve aparecer a mensagem de "Congratulations"
    Wait Until Page Contains    Congratulations