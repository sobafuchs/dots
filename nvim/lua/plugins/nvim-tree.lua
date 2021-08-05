local vim = vim
local g = vim.g
local r = require("which-key").register

require("nvim-tree.events").on_nvim_tree_ready(function() vim.cmd("NvimTreeRefresh") end)

g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_icons = {
  default =  '',
  symlink =  '',
  git = {
    unstaged = "✚",
    staged =  "✚",
    unmerged =  "≠",
    renamed =  "≫",
    untracked = "★",
  },
}
r({
  e = {"<cmd>:NvimTreeToggle<cr>", "toggle"},
}, {prefix = "<Leader>"})

-- ["n|<Leader>F"]      = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),


