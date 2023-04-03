require('vscode').setup({
    style = 'light',
    transparent = true,
    italic_comments = true,
    color_overrides = { -- Override colors (see ./lua/vscode/colors.lua)
        vscCursorDark = '#BBBBBB',
    }
})
require('vscode').load()
