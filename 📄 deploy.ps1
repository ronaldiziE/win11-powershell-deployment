# =====================================================
# Windows 11 Deploy Automation Script
# Author: Ronald Fernandes
# Description: Automated Windows 11 configuration script
# =====================================================

# Verificar se o script está sendo executado como administrador
If (-NOT ([Security.Principal.WindowsPrincipal] 
[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
[Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "Execute o script como Administrador!" -ForegroundColor Red
    Exit
}

Write-Host "Iniciando configuração automatizada do sistema..." -ForegroundColor Green

# Caminho do deploy
$deployPath = "C:\Deploy\Win11"

# Criar diretório de deploy
if (!(Test-Path $deployPath)) {
    New-Item -ItemType Directory -Path $deployPath | Out-Null
}

Write-Host "Diretório de deploy criado em $deployPath"

# Iniciar log
Start-Transcript -Path "$deployPath\deploy_log.txt"

# ================================
# Download e instalação do Chrome
# ================================

$chromeUrl = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$chromeInstaller = "$deployPath\chrome.msi"

Write-Host "Baixando Google Chrome..."

try {
    Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller
}
catch {
    Write-Host "Erro ao baixar o Chrome." -ForegroundColor Red
    Stop-Transcript
    Exit
}

Write-Host "Instalando Google Chrome..."

Start-Process msiexec.exe -ArgumentList "/i $chromeInstaller /quiet /norestart" -Wait

Write-Host "Google Chrome instalado com sucesso."

# ================================
# Configuração de idioma
# ================================

Write-Host "Configurando idioma para PT-BR..."

Set-WinSystemLocale pt-BR
Set-WinUserLanguageList pt-BR -Force

Write-Host "Idioma configurado."

# ================================
# Instalação do Office
# ================================

Write-Host "Iniciando instalação do Microsoft Office..."

$officeSetup = "$PSScriptRoot\setup.exe"
$configFile = "$PSScriptRoot\configuration.xml"

if (Test-Path $officeSetup) {
    Start-Process $officeSetup -ArgumentList "/configure $configFile" -Wait
    Write-Host "Instalação do Office finalizada."
}
else {
    Write-Host "setup.exe do Office não encontrado na pasta do script." -ForegroundColor Yellow
}

# ================================
# Finalização
# ================================

Write-Host "Configuração concluída com sucesso!" -ForegroundColor Green

Stop-Transcript
