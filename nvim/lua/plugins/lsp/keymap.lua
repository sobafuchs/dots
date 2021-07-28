local vim = vim
local r = require("which-key").register

local function define_mappings(bufnr)
  vim.api.nvim_command('nnoremap <silent>K <cmd>:Lspsaga hover_doc<CR>')
  vim.api.nvim_command("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
  vim.api.nvim_command("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")

  r({
    ["<Leader>q"] = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', "diagnostics list"}
  }, { buffer = bufnr})

  r({
    l = {
      name = "lsp",
      g = {
        name = "go to",
        d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
        -- D = {"<Cmd>lua vim.lsp.buf.declaration()<CR>", "peek definition"},
        r = {"<Cmd>lua vim.lsp.buf.references()<CR>", "references"},
        i = {"<Cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
      },
      p = {
        name = "peek",
        d = {"<Cmd>:Lspsaga preview_definition<CR>", "preview definition"},
      },
      r = {
        name = "refactor",
        a = {"<Cmd>:Lspsaga code_action<CR>", "code action"},
        r = {"<Cmd>:Lspsaga rename<CR>", "rename"}
      }
    },
  }, { buffer = bufnr, prefix = "" })

  r({
    ["<C-p>"] = {"<Cmd>:Lspsaga diagnostic_jump_prev<CR>", "Jump to Previous Error"},
    ["<C-n>"] = {"<Cmd>:Lspsaga diagnostic_jump_next<CR>", "Jump to Next Error"},
  }, { buffer = bufnr, prefix = ""})

end

return define_mappings
