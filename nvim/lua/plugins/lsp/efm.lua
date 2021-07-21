local M = {}

M.config = function(lsp_config, on_attach)
  local prettier = require("plugins.efm.prettier")
  local eslint = require("plugins.efm.eslint")
  lsp_config.efm.setup{
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact"},
    settings = {
      rootMarkers = {".git/"},
      languages = {
        typescript = {prettier, eslint},
        javascript = {eslint,prettier},
        typescriptreact = {eslint,prettier},
        javascriptreact = {eslint,prettier},
        yaml = {eslint},
        json = {eslint},
        html = {prettier, eslint},
        scss = {eslint},
        css = {prettier, eslint},
      },
    }
  }
end

return M
