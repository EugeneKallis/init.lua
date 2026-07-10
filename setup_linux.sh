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
    xclip        # optional: system clipboard integration

# ───── Telescope: fd-find ─────────────────────────────────────────────────
# On Debian/Ubuntu the binary is named `fdfind`; symlink it so Telescope
# can find it as `fd`.
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    echo "🔗 Symlinking fdfind -> fd (for telescope)"
    sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
fi

# ───── Neovim: ensure version ≥ 0.9 (required for treesitter, lazy etc.) ──
NVIM_VERSION=$(nvim --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+' || echo "0")
if awk "BEGIN { exit (!($NVIM_VERSION >= 0.9)) }"; then
    echo "⚠️  Detected Neovim ${NVIM_VERSION} — < 0.9. Installing latest via PPA..."
    sudo add-apt-repository -y ppa:neovim-ppa/unstable >/dev/null 2>&1
    sudo apt-get update -qq
    sudo apt-get install -y --no-install-recommends neovim
fi

# ───── Verification ────────────────────────────────────────────────────────
echo ""
echo "✅ Setup complete — verifying installed tools:"
for cmd in git make gcc rg fd nvim; do
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
