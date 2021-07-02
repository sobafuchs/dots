-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/roonie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/roonie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/roonie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/roonie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/roonie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.statusline\frequire\0" },
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\b\rnvim_lsp\2\tcalc\2\vbuffer\2\fluasnip\2\tpath\2\14ultisnips\2\nvsnip\2\rnvim_lua\2\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\15min_height\3\1\14min_width\3<\14max_width\3x\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\f\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3�\3\20resolve_timeout\3�\6\19source_timeout\3�\1\ndebug\1\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\18throttle_time\3P\nsetup\ncompe\frequire�̙�\6����\3\0" },
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\23plugins.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/roonie/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\b\rnvim_lsp\2\tcalc\2\vbuffer\2\fluasnip\2\tpath\2\14ultisnips\2\nvsnip\2\rnvim_lua\2\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\15min_height\3\1\14min_width\3<\14max_width\3x\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\f\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3�\3\20resolve_timeout\3�\6\19source_timeout\3�\1\ndebug\1\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\18throttle_time\3P\nsetup\ncompe\frequire�̙�\6����\3\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
