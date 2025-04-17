local trouble = require("trouble")
trouble.setup{}

vim.keymap.set("n", "<leader>eE", "<cmd>Trouble diagnostics toggle focus=false <cr>", { desc = "toggle Trouble diagnostics" });
vim.keymap.set("n", "<leader>ee", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", { desc = "toggle Trouble diagnostics" });
vim.keymap.set("n", "<leader>es", "<cmd>Trouble symbols toggle pinned=true win.relative=win win.position=right<cr>");
vim.keymap.set("n", "<leader>e.", "<cmd>Trouble qflist toggle<cr>", { desc = "toggle Trouble quickfix list" });

