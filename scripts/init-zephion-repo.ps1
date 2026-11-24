# ============================================================================
# Zephion Billkaro — Fresh Git Repository Initialization (Windows PowerShell)
# ============================================================================
# Usage:
#   powershell -ExecutionPolicy Bypass -File scripts\init-zephion-repo.ps1
# ============================================================================

$ErrorActionPreference = 'Stop'
$RepoDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)
Set-Location $RepoDir

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  Zephion Billkaro - Fresh Repository Initialization" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Safety check
if (Test-Path ".git") {
    Write-Host "WARNING: Existing .git directory found." -ForegroundColor Yellow
    Write-Host "This script will REMOVE the entire Git history and start fresh." -ForegroundColor Yellow
    Write-Host ""
    $confirm = Read-Host "Continue? (y/N)"
    if ($confirm -ne 'y' -and $confirm -ne 'Y') {
        Write-Host "Aborted." -ForegroundColor Red
        exit 1
    }
    Write-Host "Removing old .git directory..." -ForegroundColor Gray
    Remove-Item -Recurse -Force .git
    Write-Host "  Old Git history removed." -ForegroundColor Green
}

Write-Host ""
Write-Host "1. Initializing fresh Git repository..." -ForegroundColor White
git init
Write-Host "  Git initialized." -ForegroundColor Green

Write-Host ""
Write-Host "2. Configuring commit identity..." -ForegroundColor White
git config user.name "Zephion IT Solutions"
git config user.email "zephion.contact@gmail.com"
Write-Host "  Author: Zephion IT Solutions <zephion.contact@gmail.com>" -ForegroundColor Green

Write-Host ""
Write-Host "3. Setting default branch to 'main'..." -ForegroundColor White
git branch -M main
Write-Host "  Default branch: main" -ForegroundColor Green

Write-Host ""
Write-Host "4. Staging all files..." -ForegroundColor White
git add -A
Write-Host "  All files staged." -ForegroundColor Green

Write-Host ""
Write-Host "5. Creating initial commit..." -ForegroundColor White
git commit -m "Initial commit: Zephion Billkaro v1.10.86`n`nZephion Billkaro - Professional GST Invoice & Billing Software for India`nby Zephion IT Solutions (https://zephion.in)`n`nBased on Free GST Billing Software (MIT License).`nOriginal work by DiceCodes - copyright preserved in LICENSE."
Write-Host "  Initial commit created." -ForegroundColor Green

Write-Host ""
Write-Host "6. Adding remote origin..." -ForegroundColor White
git remote add origin https://github.com/zephioncontact-tech/Billkaro.git
Write-Host "  Remote: https://github.com/zephioncontact-tech/Billkaro.git" -ForegroundColor Green

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  Fresh repository initialized successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "  To push to GitHub:" -ForegroundColor White
Write-Host "    git push -u origin main" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Repository: https://github.com/zephioncontact-tech/Billkaro" -ForegroundColor White
Write-Host "  Author:     Zephion IT Solutions <zephion.contact@gmail.com>" -ForegroundColor White
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
