local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "888     888 888888b.   8888888888 8888888b.  888     888 8888888 888b     d888 ",
    "888     888 888  \"88b  888        888   Y88b 888     888   888   8888b   d8888 ",
    "888     888 888  .88P  888        888    888 888     888   888   88888b.d88888 ",
    "888     888 8888888K.  8888888    888   d88P Y88b   d88P   888   888Y88888P888 ",
    "888     888 888  \"Y88b 888        8888888P\"   Y88b d88P    888   888 Y888P 888 ",
    "888     888 888    888 888        888 T88b     Y88o88P     888   888  Y8P  888 ",
    "Y88b. .d88P 888   d88P 888        888  T88b     Y888P      888   888   \"   888 ",
    " \"Y88888P\"  8888888P\"  8888888888 888   T88b     Y8P     8888888 888       888 ",
}

dashboard.section.buttons.val = {
    dashboard.button( "<lead>ff", "🔎 > Search for file", ":Telescope find_files<CR>"),
    dashboard.button( "<lead>fs", "📖 > Search codebase for text", ":Telescope live_grep<CR>"),
    dashboard.button( "q", "✌️ > Quit UberVim", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
