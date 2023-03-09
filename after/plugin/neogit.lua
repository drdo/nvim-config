vim.keymap.set('n', '<leader>gg', require"neogit".open)
vim.keymap.set('n', '<leader>gc', function()
  require"neogit".open({ cwd = vim.fn.expand('%:h') })
end)
