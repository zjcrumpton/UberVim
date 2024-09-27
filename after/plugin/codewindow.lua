local cw = require("codewindow")
cw.setup()

vim.keymap.set("n", "<leader>pm", cw.toggle_minimap,{ desc = "toggle minimap" })
