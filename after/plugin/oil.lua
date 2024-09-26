require("oil").setup({
    default_file_explorer = false
})

vim.keymap.set("n", "<leader>po", "<CMD>Oil<CR>", { desc = "Open current parent directory with Oil" })
