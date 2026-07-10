# init.lua — Neovim config by EugeneKallis

A minimal, fast Neovim setup powered by [lazy.nvim](https://github.com/folke/lazy.nvim). Plugins are focused on productivity: fuzzy finding, git integration, file navigation, and great syntax highlighting.

## Prerequisites

Run the appropriate setup script for your OS before opening Neovim:

| OS      | Script           |
|---------|------------------|
| macOS   | `./setup_mac.sh`   |
| Linux   | `./setup_linux.sh` |

Both scripts install: **git**, **make**, **gcc/clang**, **ripgrep**, **fd**, and **neovim** (≥ 0.9).

---

## Plugins

### [lazy.nvim](https://github.com/folke/lazy.nvim)
Modern plugin manager. Bootstraps itself on first launch — no manual install needed.

### [rose-pine](https://github.com/rose-pine/neovim)
All-natural colorscheme with a soft, muted palette.  
Applied on startup as the default theme with a transparent background.

### [vim-fugitive](https://github.com/tpope/vim-fugitive)
The gold-standard Git wrapper for Vim/Neovim. Run `:Git` (mapped below) for an interactive status window, then stage/unstage/commit/diff from inside Neovim.

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
Highly extensible fuzzy finder. Bridges to **ripgrep** (`live_grep`, `grep_string`) and **fd** (`find_files`) for fast searching. Includes the `fzf-native` sorter for better ranking.

### [harpoon](https://github.com/ThePrimeagen/harpoon) (v2)
Quick-file bookmarking. Mark files you're working on and jump between them with a single keypress. Opens via a Telescope picker for an overview.

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
Better syntax highlighting, code folding, and structural navigation.  
Configured to install parsers for: **Python, JavaScript, Go, TypeScript, Bash, Lua**.

### [undotree](https://github.com/mbbill/undotree)
Visualize the undo history tree. Neovim's built-in `:undo` is linear; undotree shows the full branching history so you can jump to any previous state.

### [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
Utility library (not directly used) — dependency of both Telescope and Harpoon.

---

## Keymaps

| Mode | Key                           | Action                          | Plugin / Source     |
|------|-------------------------------|---------------------------------|---------------------|
| n    | `<leader>pv`                  | Open file explorer (`:Ex`)      | Built-in (netrw)    |
| n    | `<leader>gs`                  | Git status (`:Git`)             | vim-fugitive        |
| n    | `<leader>a`                   | Add current file to harpoon     | harpoon             |
| n    | `<C-e>`                       | Open harpoon list (Telescope)   | harpoon             |
| n    | `<C-h>`                       | Jump to harpoon slot 1          | harpoon             |
| n    | `<C-t>`                       | Jump to harpoon slot 2          | harpoon             |
| n    | `<C-n>`                       | Jump to harpoon slot 3          | harpoon             |
| n    | `<C-s>`                       | Jump to harpoon slot 4          | harpoon             |
| n    | `<C-S-P>`                     | Previous harpoon buffer         | harpoon             |
| n    | `<C-S-N>`                     | Next harpoon buffer             | harpoon             |
| n    | `<leader>pf`                  | Find files                      | telescope           |
| n    | `<C-p>`                       | Git files                       | telescope           |
| n    | `<leader>fg`                  | Live grep (search file contents)| telescope           |
| n    | `<leader>ps`                  | Grep string (prompt for query)  | telescope           |
| n    | `<leader>fb`                  | List buffers                    | telescope           |
| n    | `<leader>fh`                  | Help tags                       | telescope           |
| n    | `<leader>u`                   | Toggle undo tree                | undotree            |

**Note:** `<leader>` is set to `Space` (the spacebar).

---

## Settings (`set.lua`)

| Option                        | Value       | Effect                               |
|-------------------------------|-------------|--------------------------------------|
| `guicursor`                   | `""`        | Block cursor in all modes            |
| `nu` / `relativenumber`       | `true`      | Hybrid line numbers                  |
| `tabstop` / `shiftwidth`      | `4`         | 4-space indents                      |
| `expandtab`                   | `true`      | Tabs → spaces                        |
| `smartindent`                 | `true`      | Auto-indent                          |
| `wrap`                        | `false`     | No line wrapping                     |
| `swapfile` / `backup`         | `false`     | No swap/backup files                 |
| `undodir`                     | `~/.vim/undodir` | Persistent undo storage         |
| `undofile`                    | `true`      | Keep undo history between sessions   |
| `hlsearch`                    | `false`     | Don't highlight all search matches   |
| `incsearch`                   | `true`      | Highlight matches as you type        |
| `termguicolors`               | `true`      | 24-bit color support                 |
| `scrolloff`                   | `8`         | Keep 8 lines visible around cursor   |
| `signcolumn`                  | `yes`       | Always show sign column              |
| `updatetime`                  | `50`        | Faster swap/status refresh           |
| `colorcolumn`                 | `"80"`      | Visual ruler at column 80            |

---

## File Structure

```
~/.config/nvim/
├── init.lua                          # Entry point
├── setup_linux.sh                    # Linux dependency installer
├── setup_mac.sh                      # macOS dependency installer
├── lazy-lock.json                    # Plugin version lock
├── after/plugin/
│   ├── colors.lua                    # Colorscheme setup
│   ├── fugative.lua                  # Fugitive keymaps
│   ├── harpoon.lua                   # Harpoon keymaps
│   ├── telescope.lua                 # Telescope keymaps
│   ├── treesitter.lua                # Treesitter config & parsers
│   └── undotree.lua                  # Undotree keymaps
└── lua/eugenekallis/
    ├── init.lua                      # Module loader
    ├── lazy.lua                      # Lazy.nvim bootstrap & spec
    ├── set.lua                       # Global options
    ├── remap.lua                     # General keymaps
    └── plugins/
        ├── fugitive.lua              # Plugin spec
        ├── harpoon.lua               # Plugin spec
        ├── rose-pine.lua             # Plugin spec + colorscheme
        ├── telescope.lua             # Plugin spec
        ├── treesitter.lua            # Plugin spec
        └── undotree.lua              # Plugin spec
```
