## 📱 Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [Appium](https://appium.io/)
- [Allure Reports](https://docs.qameta.io/allure/)
- [Python 3.12](https://www.python.org/)
- [Node.js 18](https://nodejs.org/)
- [GitHub Actions](https://github.com/features/actions)

  
---

## ⚙️ Como Executar Localmente

### 📦 Pré-requisitos

- Python 3.12+
- Node.js 18+
- Appium instalado globalmente:  
```bash
  npm install -g appium
```

### 📦 Allure CLI instalada globalmente:
```bash
npm install -g allure-commandline
```

### 📦 Instalação das Dependências
```bash
pip install -r requirements.txt
```
### 🧠 Configuração das Desired Capabilities

As capabilities são definidas dinamicamente com base no valor da variável PLATFORM (android ou ios). O arquivo que gerencia isso é Start Session, encontrado nos recursos compartilhados (env.resource).

### ✅ Exemplo Android
```bash
Open Application    http://localhost:4723
... platformName=Android
... platformVersion=7.0
... automationName=UIAutomator2
... deviceName=Android Emulator
... udid=emulator-5554
... app=${EXECDIR}/app/android.wdio.native.app.v1.0.8.apk
... autoGrantPermissions=true
```

### 🍏 Exemplo iOS
```bash
Open Application    http://localhost:4723
... platformName=iOS
... platformVersion=16.4
... automationName=XCUITest
... deviceName=iPhone 14 Pro
... udid=SEU_UDID
... app=${EXECDIR}/app/ios.simulator.wdio.native.app.v1.0.8/Payload/wdiodemoapp.app
... bundleId=org.wdio.native
... autoAcceptAlerts=true
```

### ▶️ Iniciar o Servidor Appium
```bash
npx appium
```

### ▶️ Executar Testes Android
```bash
robot --variable PLATFORM:android --listener "allure_robotframework;allure_results" tests/
```

### ▶️ Executar Testes iOS
```bash
robot --variable PLATFORM:ios --listener "allure_robotframework;allure_results" tests/
```

### 📊 Gerar Relatório Allure
```bash
allure generate allure_results -o allure_report --clean
allure open allure_report
```
