#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────────────────────────────────────
# setup_mac.sh — Install system dependencies for EugeneKallis/init.lua
# Uses Homebrew.  Requires Xcode Command Line Tools for gcc / make.
# ──────────────────────────────────────────────────────────────────────────────

# ───── Xcode Command Line Tools ──────────────────────────────────────────────
if ! xcode-select -p &>/dev/null; then
    echo "🍎 Installing Xcode Command Line Tools (this will prompt you)…"
    xcode-select --install
    echo "   → Please rerun this script after the installation finishes."
    exit 0
fi

# ───── Homebrew ──────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew…"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH for the remainder of this script
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
fi

echo "🍺 Updating Homebrew…"
brew update --quiet

echo "🍺 Installing packages…"
brew install \
    git \
    make \
    ripgrep \
    fd \
    neovim

# ───── Verification ──────────────────────────────────────────────────────────
echo ""
echo "✅ Setup complete — verifying installed tools:"
for cmd in git make rg fd nvim; do
    if command -v "$cmd" &>/dev/null; then
        echo "   ✔ $cmd  ($(command -v "$cmd"))"
    else
        echo "   ✗ $cmd  NOT FOUND"
    fi
done

echo ""
echo "🚀 Now open Neovim — lazy.nvim will auto-install all plugins."
echo "   Treesitter parsers are configured in after/plugin/treesitter.lua"
echo "   and will be installed on first load."
