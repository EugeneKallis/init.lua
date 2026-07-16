# Neovim Config

> Personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## 📁 Structure

```
~/.config/nvim/
├── init.lua                          # Entry point
├── README.md                         # This file
├── lua/eugenekallis/
│   ├── init.lua                      # Loads remap, set, lazy
│   ├── lazy.lua                      # lazy.nvim bootstrap + setup
│   ├── remap.lua                     # Leader key + general remaps
│   ├── set.lua                       # Vim options
│   └── plugins/
│       ├── catppuccin.lua            # Colorscheme
│       ├── cmp.lua                   # Autocompletion (nvim-cmp)
│       ├── fugitive.lua              # Git integration
│       ├── harpoon.lua               # Quick file navigation
│       ├── lspconfig.lua             # LSP client config
│       ├── lualine.lua               # Statusline
│       ├── mason.lua                 # LSP/tool installer
│       ├── neo-tree.lua              # File explorer
│       ├── qkdb-syntax.lua           # q/kdb+ syntax highlighting
│       ├── render-markdown.lua       # Markdown rendering
│       ├── telescope.lua             # Fuzzy finder
│       ├── treesitter.lua            # Syntax highlighting / parsing
│       └── undotree.lua              # Undo history visualizer
└── after/plugin/
    ├── cmp.lua                       # Completion mappings & sources
    ├── colors.lua                    # Colorscheme + transparency
    ├── fugative.lua                  # Fugitive keymaps
    ├── harpoon.lua                   # Harpoon keymaps + setup
    ├── lsp.lua                       # Mason + LSP server configs
    ├── lualine.lua                   # Lualine config
    ├── neo-tree.lua                  # Neotree keymaps
    ├── qkdb.lua                      # q/kdb+ filetype settings
    ├── telescope.lua                 # Telescope keymaps
    ├── treesitter.lua                # Treesitter parser install
    └── undotree.lua                  # Undotree keymaps
```

---

## 🔌 Plugins

| Plugin | Repository | Description |
|--------|-----------|-------------|
| **lazy.nvim** | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (bootstrapped) |
| **Catppuccin** | [catppuccin/nvim](https://github.com/catppuccin/nvim) | Colorscheme |
| **Telescope** | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers, help, git files |
| **telescope-fzf-native** | [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope (compiled) |
| **Treesitter** | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, code understanding |
| **Harpoon** | [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) (harpoon2 branch) | Quick file marks & navigation |
| **vim-fugitive** | [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands inside Vim |
| **Undotree** | [mbbill/undotree](https://github.com/mbbill/undotree) | Visual undo history |
| **Mason** | [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool package manager |
| **nvim-lspconfig** | [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| **nvim-cmp** | [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| **LuaSnip** | [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| **Neo-tree** | [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar |
| **lazygit** | [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git UI in a floating terminal |
| **lualine** | [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| **render-markdown** | [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Live markdown rendering |
| **qkdb-syntax** | [katusk/vim-qkdb-syntax](https://github.com/katusk/vim-qkdb-syntax) | q/kdb+ syntax highlighting |
| **plenary.nvim** | [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (dependency) |
| **nui.nvim** | [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI component library (dependency) |
| **nvim-web-devicons** | [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Filetype icons (dependency) |

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

### Neo-tree (File Explorer)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>t` | Normal | `:Neotree` | Toggle file explorer sidebar |

Inside Neo-tree:
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | Normal | `open` | Open selected file/folder |
| `a` | Normal | `add` | Create new file |
| `d` | Normal | `delete` | Delete selected file |
| `r` | Normal | `rename` | Rename selected file |
| `c` | Normal | `copy` | Copy selected file |
| `p` | Normal | `paste` | Paste file |
| `q` | Normal | `close` | Close Neo-tree |

### Git

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gg` | Normal | `:LazyGit` | Open lazygit (floating terminal) |
| `<leader>gs` | Normal | `:Git` | Open Fugitive git status |

### Undo Tree

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>u` | Normal | `:UndotreeToggle` | Toggle undo history panel |

### Autocompletion (nvim-cmp)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-n>` | Insert/Select | `select_next_item` | Select next completion item |
| `<C-p>` | Insert/Select | `select_prev_item` | Select previous completion item |
| `<Tab>` | Insert/Select | `select_next_item` / `luasnip.expand_or_jump` | Next item or expand/jump snippet |
| `<S-Tab>` | Insert/Select | `select_prev_item` / `luasnip.jump(-1)` | Prev item or jump back in snippet |
| `<CR>` | Insert | `confirm({ select = true })` | Confirm selected completion |
| `<C-Space>` | Insert | `complete()` | Trigger completion manually |
| `<C-e>` | Insert | `abort()` | Cancel completion |

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

## 📊 Lualine (Statusline)

The statusline is configured with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) using the **catppuccin** theme. Sections:

| Section | Content |
|---------|---------|
| **A** | Mode (INSERT, NORMAL, VISUAL, etc.) |
| **B** | Git branch, diff, diagnostics |
| **C** | File path |
| **X** | Encoding, file format, filetype |
| **Y** | Progress (% through file) |
| **Z** | Cursor location (line:col) |

No keymaps needed — it's a display-only plugin.

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

**Catppuccin** with transparent background (`Normal` and `NormalFloat` set to `bg = "none"`).

Call `ColorMyPencils()` or pass a colorscheme name to switch: `:lua ColorMyPencils("rose-pine")`.

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
| `guicursor` | `""` | Block cursor in all modes |
