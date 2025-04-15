*** Settings ***

Library    AppiumLibrary
Library    AllureLibrary

Resource    ../env/env.resource

Resource    ../page_object/${PLATFORM}/drag.resource
Resource    ../page_object/${PLATFORM}/forms.resource
Resource    ../page_object/${PLATFORM}/login.resource
Resource    ../page_object/${PLATFORM}/swipe.resource
Resource    ../page_object/${PLATFORM}/webview.resource

*** Keywords ***

Start Session
    Run Keyword If    '${PLATFORM}' == 'android'
    ...                 Open Application    http://192.168.0.65:4723
    ...	                platformName=Android
    ...	                platformVersion=7.0
    ...	                automationName=UIAutomator2
    ...	                deviceName=Android Emulator
    ...	                app=${EXECDIR}\\app\\android.wdio.native.app.v1.0.8.apk
    ...	                udid=emulator-5554
    ...	                autoGrantPermissions=true

    Run Keyword If    '${PLATFORM}' == 'ios'
    ...                 Open Application    http://192.168.0.65:4723
    ...	                platformName=iOS
    ...	                platformVersion=16.4
    ...	                automationName=XCUITest
    ...	                deviceName=iPhone 14 Pro
    ...	                app=${EXECDIR}\\app\\ios.simulator.wdio.native.app.v1.0.8\\Payload\\wdiodemoapp.app            
    ...	                udid=6BCD0847-4AA2-42BB-B614-E1EFB2A465C8
    ...	                autoAcceptedAlerts=true
    ...	                bundleId=org.wdio.native

End Session
    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Log    Test falhou, capturando screenshot...
    ${file_path}    Set Variable    ${OUTPUT DIR}//results//${TEST NAME}.png
    Capture Page Screenshot    ${file_path}
    Attach File    ${file_path}    name=Falha - Screenshot    attachment_type=PNG
    Close Application