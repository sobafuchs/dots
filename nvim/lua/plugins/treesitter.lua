local M = {}

M.config = function()
  local ts_config = require("nvim-treesitter.configs")

  ts_config.setup {
    autopairs = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    ensure_installed = {
      "javascript",
      "html",
      "css",
      "bash",
      "lua",
      "json",
      "python",
      "ruby",
      "go",
      "rust",
      "clojure",
      "commonlisp",
      "dockerfile",
      "erlang",
      "fennel",
      "graphql",
      "comment",
      "jsdoc",
      "tsx",
      "typescript",
      "yaml",
      "regex"
    },
    highlight = {
      enable = true,
    }
  }
end

return M
