-- disable netrw (lies and says that it is already loaded)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  }
})

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFindFile<cr>')

