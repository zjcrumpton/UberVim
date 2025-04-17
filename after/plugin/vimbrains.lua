local vimbrains = require('zjcrumptondev.vimbrains')

vim.keymap.set("n", "<leader>fv", vimbrains.search_codebase, { desc = "open vimbrains search panel" })
