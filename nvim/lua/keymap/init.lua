local wk = require("which-key")
local vim = vim

register = wk.register

-- write to buffer
vim.cmd [[nno ;; :w<CR>]]
