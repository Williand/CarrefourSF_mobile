*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Home validation
    Wait Until Page Contains    Support    timeout=10s