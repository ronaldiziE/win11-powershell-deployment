# =====================================================
# Windows 11 Deploy Automation Script
# Autor: Ronald Fernandes
# Descrição: Automação de configuração inicial do Windows 11
# =====================================================

Write-Host "Iniciando configuração automatizada do sistema..." -ForegroundColor Green

# Criar diretório de deploy
$deployPath = "C:\Deploy\Win11"

if (!(Test-Path $deployPath)) {
    New-Item -ItemType Directory -Path $deployPath
}

Write-Host "Diretório de deploy criado."

# ================================
# Download e instalação do Chrome
# ================================

$chromeUrl = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$chromeInstaller = "$deployPath\chrome.msi"

Write-Host "Baixando Google Chrome..."

Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller

Write-Host "Instalando Google Chrome..."

Start-Process msiexec.exe -ArgumentList "/i $chromeInstaller /quiet /norestart" -Wait

Write-Host "Chrome instalado com sucesso."

# ================================
# Configuração de idioma
# ================================

Write-Host "Configurando idioma para PT-BR..."

Set-WinSystemLocale pt-BR
Set-WinUserLanguageList pt-BR -Force

# ================================
# Instalação do Office
# ================================

Write-Host "Iniciando instalação do Office..."

Start-Process "setup.exe" -ArgumentList "/configure configuration.xml" -Wait

# ================================
# Finalização
# ================================

Write-Host "Configuração concluída com sucesso!" -ForegroundColor Green
