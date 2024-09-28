local oil = require("oil")

oil.setup({
    default_file_explorer = false
})

vim.keymap.set("n", "<leader>po", oil.toggle_float, { desc = "Open current parent directory with Oil" })

