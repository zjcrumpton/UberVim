local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Telescope find files that are in Git' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
