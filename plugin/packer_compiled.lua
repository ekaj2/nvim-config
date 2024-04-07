-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/eagle/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?/init.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/eagle/.cache/nvim/packer_hererocks/2.1.1710088188/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["ChatGPT.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/ekaj2/ChatGPT.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["browse.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/browse.nvim",
    url = "https://github.com/lalitmee/browse.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n†\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\2\fflavour\nlatte\15background\0\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-snippy"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/cmp-snippy",
    url = "https://github.com/dcampos/cmp-snippy"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    commands = { "Copilot" },
    config = { "\27LJ\2\nˆ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\npanel\1\0\1\fenabled\1\15suggestion\1\0\2\15suggestion\0\npanel\0\1\0\1\fenabled\1\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["dropbar.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/dropbar.nvim",
    url = "https://github.com/Bekaboo/dropbar.nvim"
  },
  ["gp.nvim"] = {
    config = { "\27LJ\2\n¿\t\0\0\14\0\25\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\5\0005\4\4\0005\5\5\0=\5\6\4'\5\a\0'\6\b\0'\a\t\0'\b\n\0'\t\v\0'\n\f\0'\v\r\0'\f\14\0'\r\15\0&\5\r\5=\5\16\4>\4\1\0035\4\17\0>\4\2\0035\4\18\0005\5\19\0=\5\6\4'\5\20\0'\6\21\0'\a\22\0&\5\a\5=\5\16\4>\4\3\0035\4\23\0>\4\4\3=\3\24\2B\0\2\1K\0\1\0\vagents\1\0\1\tname\15CodeGPT3-5)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\3\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\nmodel\23gpt-4-1106-preview\1\0\5\fcommand\2\tname\rCodeGPT4\18system_prompt\0\nmodel\0\tchat\1\1\0\1\tname\15ChatGPT3-5\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\3\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\nmodel\23gpt-4-1106-preview\1\0\5\fcommand\1\tname\rChatGPT4\18system_prompt\0\nmodel\0\tchat\2\1\0\2\25chat_topic_gen_model\24gpt-4-turbo-preview\vagents\0\nsetup\agp\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/gp.nvim",
    url = "https://github.com/robitx/gp.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nS\0\0\5\0\5\0\b6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\1K\0\1\0\1\0\1\afg\f#393552\14IblIndent\16nvim_set_hl\bapi\bvimÁ\2\1\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0009\3\3\0009\3\4\0033\4\5\0B\1\3\0016\1\0\0'\3\6\0B\1\2\0029\1\a\0015\3\t\0005\4\b\0=\4\n\0035\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0=\4\18\3B\1\2\1K\0\1\0\nscope\1\0\2\15show_start\1\rshow_end\1\fexclude\rbuftypes\1\2\0\0\rterminal\14filetypes\1\0\2\rbuftypes\0\14filetypes\0\1\2\0\0\14dashboard\vindent\1\0\3\nscope\0\fexclude\0\vindent\0\1\0\1\tchar\bâ–\nsetup\bibl\0\20HIGHLIGHT_SETUP\ttype\rregister\14ibl.hooks\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\n‡\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\flibrary\1\0\1\flibrary\0\fplugins\1\0\2\fplugins\0\ntypes\2\1\2\0\0\16nvim-dap-ui\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neotest = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\ne\0\1\4\1\4\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisible¤\t\1\0\t\0005\0y6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\6\0009\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\a\0049\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\b\4=\4\4\0035\4\f\0006\5\0\0'\a\n\0B\5\2\0029\5\v\5=\5\r\4=\4\14\0035\4\15\0=\4\a\0035\4\16\0004\5\v\0006\6\0\0'\b\17\0B\6\2\0029\6\18\6>\6\1\0059\6\3\0009\6\19\0069\6\20\6>\6\2\0059\6\3\0009\6\19\0069\6\21\6>\6\3\0059\6\3\0009\6\19\0069\6\22\6>\6\4\0059\6\3\0009\6\19\0069\6\23\6>\6\5\0059\6\3\0009\6\19\0069\6\24\6>\6\6\0059\6\3\0009\6\19\0069\6\25\6>\6\a\0059\6\3\0009\6\19\0069\6\26\6>\6\b\0059\6\3\0009\6\19\0069\6\27\6>\6\t\0059\6\3\0009\6\19\0069\6\28\6>\6\n\5=\5\29\4=\4\30\0035\4!\0009\5\31\0009\5 \5)\aüÿB\5\2\2=\5\"\0049\5\31\0009\5 \5)\a\4\0B\5\2\2=\5#\0043\5$\0=\5%\0049\5\31\0009\5&\5B\5\1\2=\5'\0049\5\31\0009\5(\0055\a)\0B\5\2\2=\5*\0049\5\31\0009\5(\0055\a+\0B\5\2\2=\5,\4=\4\31\0039\4\3\0009\4-\0044\6\b\0005\a.\0>\a\1\0065\a/\0>\a\2\0065\a0\0>\a\3\0065\a1\0>\a\4\0065\a2\0>\a\5\0065\a3\0>\a\6\0065\a4\0>\a\a\6B\4\2\2=\4-\3B\1\2\0012\0\0€K\0\1\0\1\0\1\tname\nemoji\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\26vim-dadbod-completion\1\0\1\tname\vsnippy\1\0\1\tname\fcopilot\1\0\1\tname\rnvim_lsp\fsources\n<C-y>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\0\n<C-d>\n<C-u>\1\0\6\t<CR>\0\14<C-Space>\0\n<C-e>\0\n<C-d>\0\n<C-u>\0\n<C-y>\0\16scroll_docs\fmapping\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\15prioritize\28copilot_cmp.comparators\1\0\2\20priority_weight\3\2\16comparators\0\1\0\1\16completeopt\26menu,menuone,noinsert\15formatting\vformat\1\0\1\vformat\0\14formatter\30tailwindcss-colorizer-cmp\1\0\6\vwindow\0\fsorting\0\fmapping\0\fsources\0\15completion\0\15formatting\0\18documentation\15completion\1\0\2\18documentation\0\15completion\0\rbordered\vwindow\vconfig\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-dap-vscode-js"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-dap-vscode-js",
    url = "https://github.com/mxsdev/nvim-dap-vscode-js"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-scrollview"] = {
    config = { "\27LJ\2\nª\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\"scrollview_excluded_filetypes\1\0\2\"scrollview_excluded_filetypes\0\26scrollview_line_limit\3ˆ'\1\2\0\0\rNvimTree\nsetup\15scrollview\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-snippy"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-snippy",
    url = "https://github.com/dcampos/nvim-snippy"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n…\2\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0 command! Lex NvimTreeToggle\bcmd\bvim\ffilters\1\0\2\rdotfiles\2\16git_ignored\2\rrenderer\1\0\1\16group_empty\1\tview\1\0\1\nwidth\3#\1\0\4\tview\0\rrenderer\0\fsort_by\19case_sensitive\ffilters\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n€\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\27suppress_missing_scope\1\0\1\27suppress_missing_scope\0\1\0\1\16projects_v2\2\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16refactoring\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["tailwindcss-colorizer-cmp.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23color_square_width\3\2\nsetup\30tailwindcss-colorizer-cmp\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/tailwindcss-colorizer-cmp.nvim",
    url = "https://github.com/roobert/tailwindcss-colorizer-cmp.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n¶\4\0\0\4\0\26\0\"5\0\21\0005\1\3\0005\2\0\0005\3\1\0=\3\2\2=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0005\3\n\0=\3\2\2=\2\v\0015\2\f\0005\3\r\0=\3\2\2=\2\14\0015\2\15\0005\3\16\0=\3\2\2=\2\17\0015\2\18\0005\3\19\0=\3\2\2=\2\20\1=\1\22\0006\1\23\0'\3\24\0B\1\2\0029\1\25\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\18todo-comments\frequire\rkeywords\1\0\1\rkeywords\0\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\3\ticon\tó°™¨\ncolor\ttest\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ticon\bî® \ncolor\thint\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\2\balt\0\ticon\bï” \tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ticon\bï±\ncolor\fwarning\balt\0\tHACK\1\0\2\ncolor\fwarning\ticon\bî…\tTODO\1\0\2\ncolor\tinfo\ticon\bï€Œ\bFIX\1\0\a\tPERF\0\tTEST\0\tTODO\0\tNOTE\0\tHACK\0\bFIX\0\tWARN\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ticon\bï†ˆ\ncolor\nerror\balt\0\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["transfer.nvim"] = {
    commands = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtransfer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/opt/transfer.nvim",
    url = "https://github.com/coffebar/transfer.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n»\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\vexpand\fdimming\1\0\4\fcontext\3\1\fdimming\0\15treesitter\1\vexpand\0\ncolor\1\3\0\0\vNormal\f#aabbff\1\0\2\nalpha\4\0€€ ÿ\3\ncolor\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["uuid-nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vquotes\tnone\tcase\nlower\vinsert\vbefore\nsetup\14uuid-nvim\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/uuid-nvim",
    url = "/Users/eagle/projects/uuid-nvim"
  },
  ["vim-ai"] = {
    config = { "\27LJ\2\n§\3\0\0\3\0\v\0\14'\0\0\0005\1\1\0005\2\2\0=\0\3\2=\2\4\0015\2\5\0=\2\6\0016\2\a\0009\2\b\2=\1\t\0026\2\a\0009\2\b\2=\1\n\2K\0\1\0\16vim_ai_edit\20vim_ai_complete\6g\bvim\aui\1\0\1\15paste_mode\1\foptions\19initial_prompt\1\0\b\20request_timeout\3\20\16temperature\4š³æÌ\t™³æý\3\15max_tokens\3è\a\19initial_prompt\0\17endpoint_url/https://api.openai.com/v1/chat/completions\16enable_auth\2\nmodel\24gpt-4-turbo-preview\23selection_boundary\5\1\0\3\vengine\tchat\aui\0\foptions\0H            Output only code. Do not include context.\n\n            \0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-ai",
    url = "https://github.com/madox2/vim-ai"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    config = { "\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\25db_ui_use_nerd_fonts\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-just",
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vscode-js-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/opt/vscode-js-debug",
    url = "https://github.com/microsoft/vscode-js-debug"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n(\0\1\3\0\3\0\0056\1\0\0009\1\1\1+\2\2\0=\2\2\1K\0\1\0\twrap\bopt\bvim\v\0\0\1\0\0\0\1K\0\1\0©\3\1\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\5\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\16\0023\3\17\0=\3\18\0023\3\19\0=\3\20\2B\0\2\1K\0\1\0\ron_close\0\fon_open\0\fplugins\ttmux\1\0\1\fenabled\1\rgitsigns\1\0\1\fenabled\1\rtwilight\1\0\1\fenabled\2\1\0\4\rgitsigns\0\ttmux\0\foptions\0\rtwilight\0\1\0\4\fenabled\2\nruler\1\fshowcmd\1\15laststatus\3\0\vwindow\1\0\4\fplugins\0\vwindow\0\fon_open\0\ron_close\0\foptions\1\0\2\19relativenumber\1\vnumber\1\1\0\4\vheight\3\1\foptions\0\rbackdrop\4æÌ™³\6æÌ¹ÿ\3\nwidth\3P\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^copilot"] = "copilot.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n»\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\vexpand\fdimming\1\0\4\fcontext\3\1\fdimming\0\15treesitter\1\vexpand\0\ncolor\1\3\0\0\vNormal\f#aabbff\1\0\2\nalpha\4\0€€ ÿ\3\ncolor\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n†\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\2\fflavour\nlatte\15background\0\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n(\0\1\3\0\3\0\0056\1\0\0009\1\1\1+\2\2\0=\2\2\1K\0\1\0\twrap\bopt\bvim\v\0\0\1\0\0\0\1K\0\1\0©\3\1\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\5\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\16\0023\3\17\0=\3\18\0023\3\19\0=\3\20\2B\0\2\1K\0\1\0\ron_close\0\fon_open\0\fplugins\ttmux\1\0\1\fenabled\1\rgitsigns\1\0\1\fenabled\1\rtwilight\1\0\1\fenabled\2\1\0\4\rgitsigns\0\ttmux\0\foptions\0\rtwilight\0\1\0\4\fenabled\2\nruler\1\fshowcmd\1\15laststatus\3\0\vwindow\1\0\4\fplugins\0\vwindow\0\fon_open\0\ron_close\0\foptions\1\0\2\19relativenumber\1\vnumber\1\1\0\4\vheight\3\1\foptions\0\rbackdrop\4æÌ™³\6æÌ¹ÿ\3\nwidth\3P\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\5\0\5\0\b6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\1K\0\1\0\1\0\1\afg\f#393552\14IblIndent\16nvim_set_hl\bapi\bvimÁ\2\1\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0009\3\3\0009\3\4\0033\4\5\0B\1\3\0016\1\0\0'\3\6\0B\1\2\0029\1\a\0015\3\t\0005\4\b\0=\4\n\0035\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0035\4\17\0=\4\18\3B\1\2\1K\0\1\0\nscope\1\0\2\15show_start\1\rshow_end\1\fexclude\rbuftypes\1\2\0\0\rterminal\14filetypes\1\0\2\rbuftypes\0\14filetypes\0\1\2\0\0\14dashboard\vindent\1\0\3\nscope\0\fexclude\0\vindent\0\1\0\1\tchar\bâ–\nsetup\bibl\0\20HIGHLIGHT_SETUP\ttype\rregister\14ibl.hooks\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: vim-ai
time([[Config for vim-ai]], true)
try_loadstring("\27LJ\2\n§\3\0\0\3\0\v\0\14'\0\0\0005\1\1\0005\2\2\0=\0\3\2=\2\4\0015\2\5\0=\2\6\0016\2\a\0009\2\b\2=\1\t\0026\2\a\0009\2\b\2=\1\n\2K\0\1\0\16vim_ai_edit\20vim_ai_complete\6g\bvim\aui\1\0\1\15paste_mode\1\foptions\19initial_prompt\1\0\b\20request_timeout\3\20\16temperature\4š³æÌ\t™³æý\3\15max_tokens\3è\a\19initial_prompt\0\17endpoint_url/https://api.openai.com/v1/chat/completions\16enable_auth\2\nmodel\24gpt-4-turbo-preview\23selection_boundary\5\1\0\3\vengine\tchat\aui\0\foptions\0H            Output only code. Do not include context.\n\n            \0", "config", "vim-ai")
time([[Config for vim-ai]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
try_loadstring("\27LJ\2\nª\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\"scrollview_excluded_filetypes\1\0\2\"scrollview_excluded_filetypes\0\26scrollview_line_limit\3ˆ'\1\2\0\0\rNvimTree\nsetup\15scrollview\frequire\0", "config", "nvim-scrollview")
time([[Config for nvim-scrollview]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: tailwindcss-colorizer-cmp.nvim
time([[Config for tailwindcss-colorizer-cmp.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23color_square_width\3\2\nsetup\30tailwindcss-colorizer-cmp\frequire\0", "config", "tailwindcss-colorizer-cmp.nvim")
time([[Config for tailwindcss-colorizer-cmp.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n¶\4\0\0\4\0\26\0\"5\0\21\0005\1\3\0005\2\0\0005\3\1\0=\3\2\2=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0005\3\n\0=\3\2\2=\2\v\0015\2\f\0005\3\r\0=\3\2\2=\2\14\0015\2\15\0005\3\16\0=\3\2\2=\2\17\0015\2\18\0005\3\19\0=\3\2\2=\2\20\1=\1\22\0006\1\23\0'\3\24\0B\1\2\0029\1\25\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\18todo-comments\frequire\rkeywords\1\0\1\rkeywords\0\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\3\ticon\tó°™¨\ncolor\ttest\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ticon\bî® \ncolor\thint\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\2\balt\0\ticon\bï” \tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ticon\bï±\ncolor\fwarning\balt\0\tHACK\1\0\2\ncolor\fwarning\ticon\bî…\tTODO\1\0\2\ncolor\tinfo\ticon\bï€Œ\bFIX\1\0\a\tPERF\0\tTEST\0\tTODO\0\tNOTE\0\tHACK\0\bFIX\0\tWARN\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ticon\bï†ˆ\ncolor\nerror\balt\0\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n…\2\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0 command! Lex NvimTreeToggle\bcmd\bvim\ffilters\1\0\2\rdotfiles\2\16git_ignored\2\rrenderer\1\0\1\16group_empty\1\tview\1\0\1\nwidth\3#\1\0\4\tview\0\rrenderer\0\fsort_by\19case_sensitive\ffilters\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gp.nvim
time([[Config for gp.nvim]], true)
try_loadstring("\27LJ\2\n¿\t\0\0\14\0\25\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\5\0005\4\4\0005\5\5\0=\5\6\4'\5\a\0'\6\b\0'\a\t\0'\b\n\0'\t\v\0'\n\f\0'\v\r\0'\f\14\0'\r\15\0&\5\r\5=\5\16\4>\4\1\0035\4\17\0>\4\2\0035\4\18\0005\5\19\0=\5\6\4'\5\20\0'\6\21\0'\a\22\0&\5\a\5=\5\16\4>\4\3\0035\4\23\0>\4\4\3=\3\24\2B\0\2\1K\0\1\0\vagents\1\0\1\tname\15CodeGPT3-5)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\3\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\nmodel\23gpt-4-1106-preview\1\0\5\fcommand\2\tname\rCodeGPT4\18system_prompt\0\nmodel\0\tchat\1\1\0\1\tname\15ChatGPT3-5\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\3\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\nmodel\23gpt-4-1106-preview\1\0\5\fcommand\1\tname\rChatGPT4\18system_prompt\0\nmodel\0\tchat\2\1\0\2\25chat_topic_gen_model\24gpt-4-turbo-preview\vagents\0\nsetup\agp\frequire\0", "config", "gp.nvim")
time([[Config for gp.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\flibrary\1\0\1\flibrary\0\fplugins\1\0\2\fplugins\0\ntypes\2\1\2\0\0\16nvim-dap-ui\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: uuid-nvim
time([[Config for uuid-nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vquotes\tnone\tcase\nlower\vinsert\vbefore\nsetup\14uuid-nvim\frequire\0", "config", "uuid-nvim")
time([[Config for uuid-nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\ne\0\1\4\1\4\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisible¤\t\1\0\t\0005\0y6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\6\0009\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\a\0049\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\b\4=\4\4\0035\4\f\0006\5\0\0'\a\n\0B\5\2\0029\5\v\5=\5\r\4=\4\14\0035\4\15\0=\4\a\0035\4\16\0004\5\v\0006\6\0\0'\b\17\0B\6\2\0029\6\18\6>\6\1\0059\6\3\0009\6\19\0069\6\20\6>\6\2\0059\6\3\0009\6\19\0069\6\21\6>\6\3\0059\6\3\0009\6\19\0069\6\22\6>\6\4\0059\6\3\0009\6\19\0069\6\23\6>\6\5\0059\6\3\0009\6\19\0069\6\24\6>\6\6\0059\6\3\0009\6\19\0069\6\25\6>\6\a\0059\6\3\0009\6\19\0069\6\26\6>\6\b\0059\6\3\0009\6\19\0069\6\27\6>\6\t\0059\6\3\0009\6\19\0069\6\28\6>\6\n\5=\5\29\4=\4\30\0035\4!\0009\5\31\0009\5 \5)\aüÿB\5\2\2=\5\"\0049\5\31\0009\5 \5)\a\4\0B\5\2\2=\5#\0043\5$\0=\5%\0049\5\31\0009\5&\5B\5\1\2=\5'\0049\5\31\0009\5(\0055\a)\0B\5\2\2=\5*\0049\5\31\0009\5(\0055\a+\0B\5\2\2=\5,\4=\4\31\0039\4\3\0009\4-\0044\6\b\0005\a.\0>\a\1\0065\a/\0>\a\2\0065\a0\0>\a\3\0065\a1\0>\a\4\0065\a2\0>\a\5\0065\a3\0>\a\6\0065\a4\0>\a\a\6B\4\2\2=\4-\3B\1\2\0012\0\0€K\0\1\0\1\0\1\tname\nemoji\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\26vim-dadbod-completion\1\0\1\tname\vsnippy\1\0\1\tname\fcopilot\1\0\1\tname\rnvim_lsp\fsources\n<C-y>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\0\n<C-d>\n<C-u>\1\0\6\t<CR>\0\14<C-Space>\0\n<C-e>\0\n<C-d>\0\n<C-u>\0\n<C-y>\0\16scroll_docs\fmapping\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\15prioritize\28copilot_cmp.comparators\1\0\2\20priority_weight\3\2\16comparators\0\1\0\1\16completeopt\26menu,menuone,noinsert\15formatting\vformat\1\0\1\vformat\0\14formatter\30tailwindcss-colorizer-cmp\1\0\6\vwindow\0\fsorting\0\fmapping\0\fsources\0\15completion\0\15formatting\0\18documentation\15completion\1\0\2\18documentation\0\15completion\0\rbordered\vwindow\vconfig\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n€\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\27suppress_missing_scope\1\0\1\27suppress_missing_scope\0\1\0\1\16projects_v2\2\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'TransferDownload', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'TransferDownload', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TransferDownload ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TransferDirDiff', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'TransferDirDiff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TransferDirDiff ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TransferRepeat', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'TransferRepeat', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TransferRepeat ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIAddConnection', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIAddConnection', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIAddConnection ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIFindBuffer', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIFindBuffer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIFindBuffer ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUI', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUI', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUI ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIToggle', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TransferInit', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'TransferInit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TransferInit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffRemote', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'DiffRemote', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffRemote ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TransferUpload', function(cmdargs)
          require('packer.load')({'transfer.nvim'}, { cmd = 'TransferUpload', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'transfer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TransferUpload ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
