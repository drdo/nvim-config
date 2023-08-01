local neogit = require('neogit')

neogit.setup()

vim.keymap.set('n', '<leader>gg',
  neogit.open,
  { desc = "Neogit" })
vim.keymap.set('n', '<leader>gc',
  function() neogit.open({ cwd = vim.fn.expand("%:h") }) end,
  { desc = "Neogit (current file)" })
