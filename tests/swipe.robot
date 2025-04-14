*** Settings ***

Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/swipe.resource

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***

Cenário 06: Usuário faz swipe
    Dado que o usuário está na tela de swipe
    Quando o usuário clica para fazer swipe para a esquerda na tela
    Então a tela deve realizar swipe e deve aparecer o próximo item "Great Community"