vim.o.background = 'dark'

local function toggle_dark_theme()
    local current_bg = vim.opt.background:get()
    if current_bg == "dark" then
        vim.opt.background = "light"
        print("Switched to light background")
    else
        vim.opt.background = "dark"
        print("Switched to dark background")
    end
end

vim.keymap.set("n", "<leader>pd", toggle_dark_theme, { desc = "toggle dark theme" })

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

-- default color scheme is vscode
vim.cmd.colorscheme "vscode"

require("themery").setup({
    themes = {"vscode", "catppuccin", "tokyonight", "kanagawa", "nightfox", "rose-pine", "everforest", }, -- Your list of installed colorschemes.
    livePreview = true, -- Apply theme while picking. Default to true.
})

vim.keymap.set("n", "<leader>pT", function()
    vim.cmd("Themery")
end, { noremap = true, desc = "open theme switcher" })
