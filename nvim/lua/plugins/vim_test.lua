local register = require("which-key").register
local vim = vim
local g = vim.g


vim.cmd [[let test#strategy = "neovim"]]
vim.cmd [[let test#go#gotest#options = "-v -short -tags=integration"]]
vim.cmd [[let test#neovim#term_position = "vert"]]

register({
  t = {
    name = "test",
    f = {"<Cmd>:TestFile<CR>", "file"},
    t = {"<Cmd>:TestNearest<CR>", "nearest"},
    a = {"<Cmd>:TestSuite<CR>", "suite"},
  }
}, { prefix = "<Leader>"})
