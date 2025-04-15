*** Settings ***

Library    AppiumLibrary
Library    AllureLibrary

*** Keywords ***

Start Session
    Sleep    0.5
    Open Application    http://192.168.0.65:4723
    ...	                platformName=Android
    ...	                platformVersion=7.0
    ...	                automationName=UIAutomator2
    ...	                deviceName=Android Emulator
    ...	                app=${EXECDIR}\\app\\android.wdio.native.app.v1.0.8.apk
    ...	                udid=emulator-5554
    ...	                autoGrantPermissions=true

End Session
    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Log    Test falhou, capturando screenshot...
    ${file_path}    Set Variable    ${OUTPUT DIR}//results//${TEST NAME}.png
    Capture Page Screenshot    ${file_path}
    Attach File    ${file_path}    name=Falha - Screenshot    attachment_type=PNG