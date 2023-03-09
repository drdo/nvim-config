require'lspconfig'.rust_analyzer.setup{} -- Rust
require'lspconfig'.jdtls.setup{} -- Java
require'lspconfig'.tsserver.setup{}

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.daml"},
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, "filetype", "daml")
  end
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"daml"},
  callback = function(ev)
    vim.lsp.start({
      name = 'daml',
      cmd = {'daml', 'damlc', 'ide'},
      root_dir = vim.fs.dirname(vim.fs.find({'daml.yaml'}, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
  end,
})
