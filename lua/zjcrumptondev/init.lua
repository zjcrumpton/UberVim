vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("zjcrumptondev.remap")
require("zjcrumptondev.set")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
      vim.cmd("Oil close")
      vim.cmd("Alpha")
  end
})
