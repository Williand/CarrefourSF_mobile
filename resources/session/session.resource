*** Settings ***

Library    AppiumLibrary

*** Keywords ***

Start Session
    Open Application    http://192.168.0.65:4723
    ...	                platformName=Android
    ...	                platformVersion=7.0
    ...	                automationName=UIAutomator2
    ...	                deviceName=Android Emulator
    ...	                app=${EXECDIR}\\app\\android.wdio.native.app.v1.0.8.apk
    ...	                udid=emulator-5554
    ...	                autoGrantPermissions=true

End Session
    Sleep    3
    Close Application