local nvimtree = require("nvim-tree")

nvimtree.setup{
    view = {
        float = {
            enable = true
        }
    },
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        api.config.mappings.default_on_attach(bufnr)

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local preview = require('nvim-tree-preview')

        vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
        vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')

        -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
        vim.keymap.set('n', '<Tab>', function()
            local ok, node = pcall(api.tree.get_node_under_cursor)
            if ok and node then
                if node.type == 'directory' then
                    api.node.open.edit()
                else
                    preview.node(node, { toggle_focus = true })
                end
            end
        end, opts 'Preview')
    end,
}



local function toggle_file_tree()
    local view = require("nvim-tree.view")

    if not view.is_visible() then
        vim.cmd("NvimTreeFindFile")
    else
        vim.cmd("NvimTreeToggle")
    end
end

vim.keymap.set("n", "<leader>pv", toggle_file_tree, { noremap = true, silent = true, desc = "toggle file tree" })
