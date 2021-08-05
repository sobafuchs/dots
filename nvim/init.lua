local g = vim.g

-- Leader

g.mapleader = ' '
g.maplocalleader = ','

require("options")
require("plugins")
require("keymap") -- it's important that this gets required after plugins

