require("plugins.lsp.config")

local vim = vim
local cmd = vim.cmd
local wk = require("which-key")
local lspinstall = require("lspinstall")
local nvim_lsp = require('lspconfig')
local saga = require("lspsaga")
saga.init_lsp_saga()
local define_mappings = require("plugins.lsp.keymap")

function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

local on_attach = function(client, bufnr)
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  define_mappings(bufnr)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
    augroup LspAutocommands
    autocmd! * <buffer>
    autocmd BufWritePost <buffer> LspFormatting
    augroup END
    ]], true)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

-- Lua
local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim", "use"}
        }
      }
    }
  }
})
nvim_lsp.lua.setup(luadev)

nvim_lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            buildFlags = {"-tags=integration"}
        }
    }
})

nvim_lsp.jsonls.setup{}

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {usePlaceholders = true},
  filetypes = { 'javascript', 'typescript', 'typescriptreact' },
}

nvim_lsp.cssls.setup {on_attach = on_attach}
nvim_lsp.html.setup {on_attach = on_attach}


require("plugins.lsp.clojure").config(nvim_lsp, on_attach, capabilities)

-- require("plugins.lsp.efm").config(nvim_lsp, on_attach)

cmd('autocmd BufWritePre *.go lua go_org_imports(1000)')

