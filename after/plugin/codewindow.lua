local cw = require("codewindow")
cw.setup{
    auto_enable = false
}

vim.keymap.set("n", "<leader>pm", cw.toggle_minimap,{ desc = "toggle minimap" })
