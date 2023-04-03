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

vim.keymap.set('n', '<leader>f',
  require"telescope.builtin".find_files,
  { desc = "Find files (Telescope)" })
vim.keymap.set('n', '<leader>s',
  require"telescope.builtin".live_grep,
  { desc = "Live grep (Telescope)" })
vim.keymap.set('n', '<leader>h',
  require"telescope.builtin".help_tags,
  { desc = "Help tags (Telescope)" })
vim.keymap.set('n', '<leader>b',
  require"telescope.builtin".buffers,
  { desc = "Buffers (Telescope)" })
