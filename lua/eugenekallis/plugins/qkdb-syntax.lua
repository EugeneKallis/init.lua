return {
  'katusk/vim-qkdb-syntax',
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
      pattern = { '*.q', '*.k' },
      callback = function(args)
        vim.bo[args.buf].filetype = 'q'
      end,
    })
  end,
}
