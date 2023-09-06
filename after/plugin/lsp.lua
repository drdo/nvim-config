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
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>d', ":lua require('telescope.builtin').diagnostics()<CR>")
    vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
  end,
})


require'lspconfig'.jdtls.setup{} -- Java
require'lspconfig'.tsserver.setup{} -- Typescript/Javascript/React
require'lspconfig'.html.setup{} -- HTML, CSS
require'lspconfig'.pyright.setup{} -- Python

-- Rust
local rt = require("rust-tools")
rt.setup({
  server = {
    settings = {
      ['rust-analyzer'] = {
        -- diagnostics = {
        --   disabled = {"inactive-code"},
        -- },
        cargo = {
          allFeatures = true,
        },
      },
    },
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
