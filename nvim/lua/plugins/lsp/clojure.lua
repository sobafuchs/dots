local M = {}

M.config = function(lsp_config, on_attach, capabilities)
  lsp_config.clojure_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M
