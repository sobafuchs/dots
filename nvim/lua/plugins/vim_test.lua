local register = require("which-key").register

vim.cmd [[let test#strategy = "neoterm"]]
vim.cmd [[let test#go#gotest#options = "-v -short -tags=integration"]]
vim.g.neoterm_default_mod = "botright"

register({
  t = {
    name = "test",
    f = {"<Cmd>:TestFile<CR>", "file"},
    t = {"<Cmd>:TestNearest<CR>", "nearest"},
    a = {"<Cmd>:TestSuite<CR>", "suite"}
  }
}, { prefix = "<Leader>"})
