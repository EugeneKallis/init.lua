#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────────────────────────────────────
# setup_linux.sh — Install system dependencies for EugeneKallis/init.lua
# Tested on Debian / Ubuntu / WSL. For other distros, adapt the apt commands.
# ──────────────────────────────────────────────────────────────────────────────

echo "📦 Updating package lists..."
sudo apt-get update -qq

echo "📦 Installing essential build & dev packages..."
sudo apt-get install -y --no-install-recommends \
    git \
    make \
    gcc \
    ripgrep \
    fd-find \
    neovim \
    xclip \
    curl \
    unzip

echo "📦 Installing tree-sitter CLI (for nvim-treesitter parser builds)..."
npm install -g tree-sitter-cli

# ───── Telescope: fd-find ─────────────────────────────────────────────────
# On Debian/Ubuntu the binary is named `fdfind`; symlink it so Telescope
# can find it as `fd`.
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    echo "🔗 Symlinking fdfind -> fd (for telescope)"
    sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
fi

# ───── Neovim: ensure version ≥ 0.12 ────────────────────────────────────
NVIM_VERSION=$(nvim --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+' || echo "0")
if awk "BEGIN { exit (!($NVIM_VERSION >= 0.12)) }"; then
    echo "⚠️  Detected Neovim ${NVIM_VERSION} — < 0.12. Install via AppImage:"
    echo "   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
    echo "   chmod u+x nvim-linux-x86_64.appimage"
    echo "   sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim"
fi

# ───── stylua: install directly so Mason doesn't have to ─────────────────
if ! command -v stylua &>/dev/null; then
    echo "📦 Installing stylua..."
    STYLUA_VERSION="2.5.2"
    curl -LO "https://github.com/JohnnyMorganz/StyLua/releases/download/v${STYLUA_VERSION}/stylua-linux-x86_64.zip"
    unzip -o "stylua-linux-x86_64.zip" -d /tmp/stylua-extract
    sudo mv /tmp/stylua-extract/stylua /usr/local/bin/
    rm -rf "stylua-linux-x86_64.zip" /tmp/stylua-extract
    echo "✔ stylua installed"
fi

# ───── Verification ────────────────────────────────────────────────────────
echo ""
echo "✅ Setup complete — verifying installed tools:"
for cmd in git make gcc rg fd nvim tree-sitter stylua; do
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
