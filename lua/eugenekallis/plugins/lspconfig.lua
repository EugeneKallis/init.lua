return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Keymaps and LSP capabilities can be added here
    -- Example: enable completion with nvim-cmp if installed
  end,
}
