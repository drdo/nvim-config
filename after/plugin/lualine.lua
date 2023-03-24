require('lualine').setup{
    options = {
        theme = 'vscode'
    },
    sections = {
        lualine_c = {
            { 'filename', path = 1 }
        }
    }
}

vim.opt.showmode = false -- Lualine already shows this
