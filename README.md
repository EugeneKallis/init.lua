# Neovim Config

> Personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## 📁 Structure

```
~/.config/nvim/
├── init.lua                          # Entry point
├── lua/eugenekallis/
│   ├── init.lua                      # Loads all modules
│   ├── lazy.lua                      # lazy.nvim bootstrap + setup
│   ├── remap.lua                     # Leader key + general remaps
│   ├── set.lua                       # Vim options
│   ├── lsp.lua                       # LSP keymaps + server configs
│   └── plugins/
│       ├── telescope.lua             # Fuzzy finder
│       ├── treesitter.lua            # Syntax highlighting / parsing
│       ├── harpoon.lua               # Quick file navigation
│       ├── fugitive.lua              # Git integration
│       ├── undotree.lua              # Undo history visualizer
│       ├── rose-pine.lua             # Colorscheme
│       └── mason.lua                 # LSP/tool installer
└── after/plugin/
    ├── colors.lua                    # Colorscheme + transparency
    ├── telescope.lua                 # Telescope keymaps
    ├── harpoon.lua                   # Harpoon keymaps + setup
    ├── fugative.lua                  # Fugitive keymaps
    ├── undotree.lua                  # Undotree keymaps
    └── treesitter.lua               # Treesitter parser install
```

---

## 🔌 Plugins

| Plugin | Repository | Description |
|--------|-----------|-------------|
| **lazy.nvim** | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (bootstrapped) |
| **Telescope** | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers, help, git files |
| **telescope-fzf-native** | [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope (compiled) |
| **Treesitter** | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, code understanding |
| **Harpoon** | [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) (harpoon2 branch) | Quick file marks & navigation |
| **vim-fugitive** | [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands inside Vim |
| **Undotree** | [mbbill/undotree](https://github.com/mbbill/undotree) | Visual undo history |
| **Rose Pine** | [rose-pine/neovim](https://github.com/rose-pine/neovim) | Colorscheme |
| **Mason** | [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool package manager |
| **plenary.nvim** | [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (dependency) |

---

## ⌨️ Keymaps

> **Leader key:** `Space`

### General

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>pv` | Normal | `:Ex` | Open file explorer (netrw) |

### Telescope

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>pf` | Normal | `builtin.find_files` | Find files |
| `<C-p>` | Normal | `builtin.git_files` | Find git-tracked files |
| `<leader>fg` | Normal | `builtin.live_grep` | Live grep across project |
| `<leader>ps` | Normal | `grep_string` | Grep for user-input string |
| `<leader>fb` | Normal | `builtin.buffers` | List open buffers |
| `<leader>fh` | Normal | `builtin.help_tags` | Search help tags |

### Harpoon

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>a` | Normal | `harpoon:list():add()` | Add current file to Harpoon |
| `<C-e>` | Normal | Telescope Harpoon picker | Open Harpoon list in Telescope |
| `<C-h>` | Normal | `harpoon:list():select(1)` | Jump to mark 1 |
| `<C-t>` | Normal | `harpoon:list():select(2)` | Jump to mark 2 |
| `<C-n>` | Normal | `harpoon:list():select(3)` | Jump to mark 3 |
| `<C-s>` | Normal | `harpoon:list():select(4)` | Jump to mark 4 |
| `<C-S-P>` | Normal | `harpoon:list():prev()` | Previous Harpoon buffer |
| `<C-S-N>` | Normal | `harpoon:list():next()` | Next Harpoon buffer |

### Git (Fugitive)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gs` | Normal | `:Git` | Open Fugitive git status |

### Undo Tree

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>u` | Normal | `:UndotreeToggle` | Toggle undo history panel |

### LSP (buffer-local, when LSP is attached)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gd` | Normal | `vim.lsp.buf.definition` | Go to definition |
| `gD` | Normal | `vim.lsp.buf.declaration` | Go to declaration |
| `gi` | Normal | `vim.lsp.buf.implementation` | Go to implementation |
| `gr` | Normal | `vim.lsp.buf.references` | Go to references |
| `K` | Normal | `vim.lsp.buf.hover` | Hover documentation |
| `<leader>rn` | Normal | `vim.lsp.buf.rename` | Rename symbol under cursor |
| `<leader>ca` | Normal | `vim.lsp.buf.code_action` | Code action |
| `<leader>f` | Normal | `vim.lsp.buf.format` | Format buffer (async) |
| `<leader>e` | Normal | `vim.diagnostic.open_float` | Show diagnostic in float |
| `[d` | Normal | `vim.diagnostic.goto_prev` | Previous diagnostic |
| `]d` | Normal | `vim.diagnostic.goto_next` | Next diagnostic |

> Inlay hints are auto-enabled for servers that support them.

---

## 🛠 LSP Servers (via Mason)

Mason auto-installs these servers:

| Server | Language | Config highlights |
|--------|----------|-------------------|
| **lua_ls** | Lua | LuaJIT runtime, `vim` global recognized |
| **gopls** | Go | Static analysis, gofumpt, inlay hints |
| **pyright** | Python | Default config |
| **ts_ls** | TypeScript/JS | Complete function calls enabled |
| **bashls** | Bash/Shell | `*.sh`, `*.bash`, `*.command` glob |

---

## 🎨 Colorscheme

**Rose Pine** with transparent background (`Normal` and `NormalFloat` set to `bg = "none"`).

Call `:ColorMyPencils()` or pass a colorscheme name to switch: `:lua ColorMyPencils("catppuccin")`.

---

## ⚙️ Vim Options

| Option | Value | Description |
|--------|-------|-------------|
| `number` + `relativenumber` | `true` | Line numbers with relative offsets |
| `tabstop` / `softtabstop` / `shiftwidth` | `4` | 4-space indentation |
| `expandtab` | `true` | Spaces, not tabs |
| `smartindent` | `true` | Smart auto-indenting |
| `wrap` | `false` | No line wrapping |
| `swapfile` / `backup` | `false` | No swap/backup files |
| `undofile` | `true` | Persistent undo (`~/.vim/undodir`) |
| `hlsearch` | `false` | No search highlighting |
| `incsearch` | `true` | Incremental search |
| `termguicolors` | `true` | 24-bit color |
| `scrolloff` | `8` | Keep 8 lines above/below cursor |
| `signcolumn` | `"yes"` | Always show sign column |
| `updatetime` | `50` | Faster completion/diagnostics |
| `colorcolumn` | `"80"` | Ruler at column 80 |
