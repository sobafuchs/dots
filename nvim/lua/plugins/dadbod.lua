local r = require("which-key").register
local vim = vim

r({
  d = {
    name = "database",
    u = {"<cmd>:DBUIToggle<cr>", "toggle ui"},
    f = {"<cmd>:DBUIFindBuffer<cr>", "find buffer"},
    r = {"<cmd>:DBUIRenameBuffer<cr>", "renamer buffer"},
    l = {"<cmd>:DBUILastQueryInfo<cr>", "last query"}
  },
}, {prefix = "<leader>"})

vim.g.db_ui_save_location = '~/.config/db_ui'

vim.cmd [[autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni]]
