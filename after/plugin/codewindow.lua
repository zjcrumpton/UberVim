local cw = require("codewindow")
cw.setup{
    auto_enable = true
}

vim.keymap.set("n", "<leader>pm", cw.toggle_minimap,{ desc = "toggle minimap" })
