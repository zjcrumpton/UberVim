require("nvim-tree").setup()

local function toggle_file_tree()
    local view = require("nvim-tree.view")

    if not view.is_visible() then
        vim.cmd("NvimTreeFindFile")
    else
        vim.cmd("NvimTreeToggle")
    end
end

vim.keymap.set("n", "<leader>pv", toggle_file_tree, { noremap = true, silent = true, desc = "toggle file tree" })
