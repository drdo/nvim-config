require('vscode').setup({
    style = 'dark',
    transparent = true,
    italic_comments = true,
    color_overrides = { -- Override colors (see ./lua/vscode/colors.lua)
        vscCursorDark = '#BBBBBB',
    }
})
require('vscode').load()
