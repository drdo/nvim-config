require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<up>"] = require('telescope.actions').cycle_history_prev,
        ["<down>"] = require('telescope.actions').cycle_history_next
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

local telescope = require("telescope.builtin")

function current_buffer_directory()
  local path = vim.fn.expand('%:p:h')
  if path == "" then
    return vim.b[0].netrw_curdir 
  else
    return path
  end
end

vim.keymap.set('n', '<leader>f',
  telescope.find_files,
  { desc = "Find files (Telescope)" })
vim.keymap.set('n', '<leader>F',
  function() telescope.find_files { cwd = current_buffer_directory() } end,
  { desc = "Find files (Telescope)" })

vim.keymap.set('n', '<leader>s',
  telescope.live_grep,
  { desc = "Live grep (Telescope)" })
vim.keymap.set('n', '<leader>S',
  function() telescope.live_grep { cwd = current_buffer_directory() } end,
  { desc = "Live grep (Telescope)" })

vim.keymap.set('n', '<leader>h',
  telescope.help_tags,
  { desc = "Help tags (Telescope)" })

vim.keymap.set('n', '<leader>b',
  telescope.buffers,
  { desc = "Buffers (Telescope)" })
