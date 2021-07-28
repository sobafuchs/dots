local r = require("which-key").register

r({
  ["<A-,"] = {"<cmd>:BufferPrevious<cr>", "previous buffer"},
  ["<A-."] = {"<cmd>:BufferNext<cr>", "next buffer"},
  ["<A-1"] = {"<cmd>:BufferGoTo 1", "buffer 1"},
})
