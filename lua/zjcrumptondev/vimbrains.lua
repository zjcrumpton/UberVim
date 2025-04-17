local M = {}

local current_tab = 1
local tabs = { "Files", "Text", "Classes", "Functions", "Open Buffers", "Git" }

local function draw_tab_bar(buf)
    local tab_line = "  " .. table.concat(tabs, "  |  ")
    vim.api.nvim_buf_set_lines(buf, 0, 1, false, { tab_line })
    -- Highlight the active tab
    vim.api.nvim_buf_add_highlight(buf, -1, 'TabHighlight', 0, 2 + ((current_tab - 1) * 10), 2 + (current_tab * 10) - 1)
end

function open_vimbrains_search()
    local buffer = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buffer, true, {
        relative = 'editor',
        width = 50,
        height = 1,
        row = 10,
        col = 20,
        style = 'minimal'
    })

    draw_tab_bar(buffer)

    -- Handling input and search
    vim.api.nvim_buf_set_keymap(buffer, 'i', '<CR>', '<cmd>lua require("zjcrumptondev.vimbrains").handle_input()<CR>', { noremap = true })
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { "Search: " })
    vim.cmd('startinsert')
end

local function search_files(query)
    require('telescope.builtin').find_files({ prompt_title = "Search Files", search = query })
end

local function search_text(query)
    require('telescope.builtin').live_grep({ prompt_title = "Search Text", search = query })
end

local function search_classes(query)
    vim.lsp.buf.workspace_symbol(query, { kind = "Class" }) -- Search for class symbols
end

local function search_functions(query)
    vim.lsp.buf.workspace_symbol(query, { kind = "Function" }) -- Search for function symbols
end

local function search_open_buffers(query)
    local buffers = vim.api.nvim_list_bufs()
    -- Filter and show buffers based on the query
end

local function search_git(query)

    require('telescope.builtin').git_commits({ prompt_title = "Search Git Commits", search = query })
end

function M.handle_input()
    local input = vim.fn.getline(".")  -- Get the search query

    if current_tab == 1 then
        search_files(input)
    elseif current_tab == 2 then
        search_text(input)
    elseif current_tab == 3 then
        search_classes(input)
    elseif current_tab == 4 then
        search_functions(input)
    elseif current_tab == 5 then
        search_open_buffers(input)
    elseif current_tab == 6 then
        search_git(input)
    end
end

function M.search_codebase()
    open_vimbrains_search()
end

return M
