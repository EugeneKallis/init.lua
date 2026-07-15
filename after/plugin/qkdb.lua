vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.q', '*.k' },
  callback = function(args)
    vim.bo[args.buf].filetype = 'q'
  end,
})
