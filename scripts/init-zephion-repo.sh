#!/usr/bin/env bash
# ============================================================================
# Zephion Billkaro — Fresh Git Repository Initialization
# ============================================================================
# This script prepares a clean Git repository for the Zephion Billkaro project.
# It removes the old .git history and creates a fresh initial commit.
#
# Usage:
#   chmod +x scripts/init-zephion-repo.sh
#   ./scripts/init-zephion-repo.sh
#
# Or on Windows (Git Bash):
#   bash scripts/init-zephion-repo.sh
# ============================================================================

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║   Zephion Billkaro — Fresh Repository Initialization        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Safety check
if [ -d ".git" ]; then
  echo "⚠  Existing .git directory found."
  echo "   This script will REMOVE the entire Git history and start fresh."
  echo ""
  read -p "   Continue? (y/N) " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "   Aborted."
    exit 1
  fi
  echo "   Removing old .git directory..."
  rm -rf .git
  echo "   ✓ Old Git history removed."
fi

echo ""
echo "1. Initializing fresh Git repository..."
git init
echo "   ✓ Git initialized."

echo ""
echo "2. Configuring commit identity..."
git config user.name "Zephion IT Solutions"
git config user.email "zephion.contact@gmail.com"
echo "   ✓ Author: Zephion IT Solutions <zephion.contact@gmail.com>"

echo ""
echo "3. Setting default branch to 'main'..."
git branch -M main
echo "   ✓ Default branch: main"

echo ""
echo "4. Staging all files..."
git add -A
echo "   ✓ All files staged."

echo ""
echo "5. Creating initial commit..."
git commit -m "Initial commit: Zephion Billkaro v1.10.86

Zephion Billkaro — Professional GST Invoice & Billing Software for India
by Zephion IT Solutions (https://zephion.in)

Based on Free GST Billing Software (MIT License).
Original work by DiceCodes — copyright preserved in LICENSE.

Features:
- Tax Invoice, Proforma, Credit Note, Delivery Challan
- GSTR-1/3B JSON exports, GSTR-2B reconciliation
- TDS/TCS reports (Form 26Q/27EQ), e-Way Bill
- Multi-currency invoicing (22+ countries)
- Offline-first PWA with Google Drive backup
- Multi-business profiles, stock management
- PDF generation, print, WhatsApp sharing"
echo "   ✓ Initial commit created."

echo ""
echo "6. Adding remote origin..."
git remote add origin https://github.com/zephioncontact-tech/Billkaro.git
echo "   ✓ Remote: https://github.com/zephioncontact-tech/Billkaro.git"

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "✅ Fresh repository initialized successfully!"
echo ""
echo "   To push to GitHub:"
echo "     git push -u origin main"
echo ""
echo "   Repository: https://github.com/zephioncontact-tech/Billkaro"
echo "   Author:     Zephion IT Solutions <zephion.contact@gmail.com>"
echo "══════════════════════════════════════════════════════════════"
echo ""
