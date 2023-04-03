require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-p>"] = require('telescope.actions').cycle_history_prev,
        ["<C-n>"] = require('telescope.actions').cycle_history_next
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      initial_mode = "normal"
    }
  }
}
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>f', ':lua require"telescope.builtin".find_files()<CR>')
vim.keymap.set('n', '<leader>s', ':lua require"telescope.builtin".live_grep()<CR>')
vim.keymap.set('n', '<leader>h', ':lua require"telescope.builtin".help_tags()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require"telescope.builtin".buffers()<CR>')
