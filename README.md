# 🚀 Windows 11 Deployment Automation

PowerShell script for automated Windows 11 setup and initial configuration.

This project automates common post-installation tasks in Windows 11 environments, such as installing software and configuring system settings.

---

## 📌 Features

- Automatic deployment folder creation
- Google Chrome automated download and installation
- Windows language configuration (PT-BR)
- Microsoft Office installation using Office Deployment Tool
- Installation logging

---

## ⚙️ Technologies

- PowerShell
- Windows 11
- Automation Scripts
- System Deployment
![Deploy](images/deploy-process.png)
---

## 📂 Project Structure
## Processo de Deploy

# Windows 11 PowerShell Deployment

Script de automação para configuração inicial do Windows 11 em ambientes corporativos.

## Processo de automação

![Deploy Process](deploy-process.png)
## Execução do Script

Execute o script como administrador a partir do computador cliente:

powershell.exe -ExecutionPolicy Bypass -File \\SERVIDOR\Deploy\Win11\instalar.ps1
## Estrutura do Projeto

win11-powershell-deployment
│
├── Deploy
│   └── Win11
│       ├── instalar.ps1
│       └── configuration.xml
│
├── README.md
└── LICENSE
## Tecnologias

- Windows 11
- Windows Server
- PowerShell
- Automação de deploy
