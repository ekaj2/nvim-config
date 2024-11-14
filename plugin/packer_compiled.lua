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
local package_path_str = "/Users/eagle/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/Users/eagle/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/eagle/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
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
  ["gp.nvim"] = {
    config = { "\27LJ\2\nR\0\1\4\0\3\0\0065\1\0\0'\2\1\0\18\3\0\0&\2\3\2=\2\2\1L\1\2\0\tdesc\16GPT prompt \1\0\4\fnoremap\2\tdesc\0\vsilent\2\vnowait\2.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15LspRestart\bcmd\bvimX\3\0\6\1\4\1\r4\0\3\0G\1\0\0?\1\0\0-\1\0\0006\3\0\0\18\5\0\0B\3\2\0A\1\0\0016\1\1\0009\1\2\0013\3\3\0B\1\2\1K\0\1\0\1À\0\rschedule\bvim\vunpack\3€€À™\4Ð\20\1\0\14\0E\0®\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\4\0006\5\5\0009\5\6\5'\a\a\0B\5\2\2=\5\b\4=\4\n\0035\4\v\0006\5\5\0009\5\6\5'\a\f\0B\5\2\2=\5\b\4=\4\r\3=\3\14\0024\3\a\0005\4\15\0005\5\16\0=\5\17\4'\5\18\0'\6\19\0'\a\20\0'\b\21\0'\t\22\0'\n\23\0'\v\24\0'\f\25\0'\r\26\0&\5\r\5=\5\27\4>\4\1\0035\4\28\0005\5\29\0=\5\17\4'\5\30\0'\6\31\0'\a \0&\5\a\5=\5\27\4>\4\2\0035\4!\0005\5\"\0=\5\17\4'\5\18\0'\6\19\0'\a\20\0'\b\21\0'\t\22\0'\n\23\0'\v\24\0'\f\25\0'\r\26\0&\5\r\5=\5\27\4>\4\3\0035\4#\0>\4\4\0035\4$\0005\5%\0=\5\17\4'\5\30\0'\6\31\0'\a \0&\5\a\5=\5\27\4>\4\5\0035\4&\0>\4\6\3=\3'\2B\0\2\0013\0(\0006\1)\0009\1*\0019\1+\1'\3,\0'\4-\0'\5.\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4-\0'\0050\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0041\0'\0052\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0043\0'\0054\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0045\0'\0056\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\0047\0'\0058\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\0049\0'\5:\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4;\0'\5<\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4=\0'\5>\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4?\0'\5@\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\4?\0'\5A\0004\6\0\0B\1\5\0016\1)\0009\1B\0019\1C\0016\2)\0009\2B\0023\3D\0=\3C\0022\0\0€K\0\1\0\0\14GpRewrite\afn\29:<C-u>'<,'>GpRewrite<cr>\23<cmd>GpRewrite<cr>\14<leader>k\26<cmd>GpChatFinder<cr>\16<leader>gpf\26<cmd>GpChatToggle<cr>\16<leader>gpt\23<cmd>GpChatNew<cr>\14<leader>c\29:<C-u>'<,'>GpWhisper<cr>\16<leader>gpd$:<C-u>'<,'>GpWhisperRewrite<cr>\16<leader>gpw\31:<C-u>'<,'>GpImplement<cr>\16<leader>gpi\31:<C-u>'<,'>GpChatPaste<cr>\16<leader>gpp\30<cmd>GpChatNew vsplit<cr>\6n$:<C-u>'<,'>GpChatNew vsplit<cr>\16<leader>gpn\6v\20nvim_set_keymap\bapi\bvim\0\vagents\1\0\2\tname\15CodeGPT3-5\fdisable\2\1\0\3\ntop_p\3\1\nmodel\23gpt-4-1106-preview\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\6\tname\rCodeGPT4\nmodel\0\18system_prompt\0\fdisable\2\fcommand\2\tchat\1\1\0\2\tname\15ChatGPT3-5\fdisable\2\1\0\3\ntop_p\3\1\nmodel\23gpt-4-1106-preview\16temperature\4š³æÌ\t™³Æÿ\3\1\0\6\tname\rChatGPT4\nmodel\0\18system_prompt\0\fdisable\2\fcommand\1\tchat\2)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\1\nmodel\31claude-3-5-sonnet-20240620\1\0\5\tname\18CodeSonnet3-5\fcommand\2\18system_prompt\0\nmodel\0\tchat\1\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\1\nmodel\31claude-3-5-sonnet-20240620\1\0\5\tname\14Sonnet3-5\fcommand\1\18system_prompt\0\nmodel\0\tchat\2\14providers\14anthropic\22ANTHROPIC_API_KEY\1\0\2\vsecret\0\rendpoint*https://api.anthropic.com/v1/messages\vopenai\1\0\2\vopenai\0\14anthropic\0\vsecret\19OPENAI_API_KEY\vgetenv\aos\1\0\2\vsecret\0\rendpoint/https://api.openai.com/v1/chat/completions\1\0\3\vagents\0\14providers\0\25chat_topic_gen_model\24gpt-4-turbo-preview\nsetup\agp\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/gp.nvim",
    url = "https://github.com/robitx/gp.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
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
  ["nvim-cmp"] = {
    config = { "\27LJ\2\ne\0\1\4\1\4\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleå\a\1\0\b\0-\0k6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\6\0009\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\a\0049\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\b\4=\4\4\0034\4\0\0=\4\n\0035\4\v\0=\4\a\0035\4\f\0004\5\n\0009\6\3\0009\6\r\0069\6\14\6>\6\1\0059\6\3\0009\6\r\0069\6\15\6>\6\2\0059\6\3\0009\6\r\0069\6\16\6>\6\3\0059\6\3\0009\6\r\0069\6\17\6>\6\4\0059\6\3\0009\6\r\0069\6\18\6>\6\5\0059\6\3\0009\6\r\0069\6\19\6>\6\6\0059\6\3\0009\6\r\0069\6\20\6>\6\a\0059\6\3\0009\6\r\0069\6\21\6>\6\b\0059\6\3\0009\6\r\0069\6\22\6>\6\t\5=\5\23\4=\4\24\0035\4\27\0009\5\25\0009\5\26\5)\aüÿB\5\2\2=\5\28\0049\5\25\0009\5\26\5)\a\4\0B\5\2\2=\5\29\0043\5\30\0=\5\31\0049\5\25\0009\5 \5B\5\1\2=\5!\0049\5\25\0009\5\"\0055\a#\0B\5\2\2=\5$\0049\5\25\0009\5\"\0055\a%\0B\5\2\2=\5&\4=\4\25\0039\4\3\0009\4'\0044\6\6\0005\a(\0>\a\1\0065\a)\0>\a\2\0065\a*\0>\a\3\0065\a+\0>\a\4\0065\a,\0>\a\5\6B\4\2\2=\4'\3B\1\2\0012\0\0€K\0\1\0\1\0\1\tname\nemoji\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\vsnippy\1\0\1\tname\rnvim_lsp\fsources\n<C-y>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\0\n<C-d>\n<C-u>\1\0\6\n<C-d>\0\t<CR>\0\n<C-u>\0\n<C-e>\0\n<C-y>\0\14<C-Space>\0\16scroll_docs\fmapping\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\1\0\2\20priority_weight\3\2\16comparators\0\1\0\1\16completeopt\26menu,menuone,noinsert\15formatting\1\0\6\15formatting\0\fmapping\0\vwindow\0\fsorting\0\15completion\0\fsources\0\18documentation\15completion\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
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
    config = { "\27LJ\2\n…\2\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0 command! Lex NvimTreeToggle\bcmd\bvim\ffilters\1\0\2\16git_ignored\2\rdotfiles\2\rrenderer\1\0\1\16group_empty\1\tview\1\0\1\nwidth\3#\1\0\4\rrenderer\0\tview\0\ffilters\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
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
  rustaceanvim = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/rustaceanvim",
    url = "https://github.com/mrcjkb/rustaceanvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n¶\4\0\0\4\0\26\0\"5\0\21\0005\1\3\0005\2\0\0005\3\1\0=\3\2\2=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0005\3\n\0=\3\2\2=\2\v\0015\2\f\0005\3\r\0=\3\2\2=\2\14\0015\2\15\0005\3\16\0=\3\2\2=\2\17\0015\2\18\0005\3\19\0=\3\2\2=\2\20\1=\1\22\0006\1\23\0'\3\24\0B\1\2\0029\1\25\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\18todo-comments\frequire\rkeywords\1\0\1\rkeywords\0\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\3\ticon\tó°™¨\ncolor\ttest\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ticon\bî® \ncolor\thint\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\2\ticon\bï” \balt\0\tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ticon\bï±\ncolor\fwarning\balt\0\tHACK\1\0\2\ticon\bî…\ncolor\fwarning\tTODO\1\0\2\ticon\bï€Œ\ncolor\tinfo\bFIX\1\0\a\tNOTE\0\tHACK\0\bFIX\0\tTODO\0\tWARN\0\tPERF\0\tTEST\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ticon\bï†ˆ\ncolor\nerror\balt\0\0" },
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
    url = "/Users/eagle/projects/transfer.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/eagle/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n¶\4\0\0\4\0\26\0\"5\0\21\0005\1\3\0005\2\0\0005\3\1\0=\3\2\2=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0005\3\n\0=\3\2\2=\2\v\0015\2\f\0005\3\r\0=\3\2\2=\2\14\0015\2\15\0005\3\16\0=\3\2\2=\2\17\0015\2\18\0005\3\19\0=\3\2\2=\2\20\1=\1\22\0006\1\23\0'\3\24\0B\1\2\0029\1\25\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\18todo-comments\frequire\rkeywords\1\0\1\rkeywords\0\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\3\ticon\tó°™¨\ncolor\ttest\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ticon\bî® \ncolor\thint\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\2\ticon\bï” \balt\0\tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ticon\bï±\ncolor\fwarning\balt\0\tHACK\1\0\2\ticon\bî…\ncolor\fwarning\tTODO\1\0\2\ticon\bï€Œ\ncolor\tinfo\bFIX\1\0\a\tNOTE\0\tHACK\0\bFIX\0\tTODO\0\tWARN\0\tPERF\0\tTEST\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ticon\bï†ˆ\ncolor\nerror\balt\0\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\ne\0\1\4\1\4\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleå\a\1\0\b\0-\0k6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\6\0009\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\a\0049\5\3\0009\5\4\0059\5\5\5B\5\1\2=\5\b\4=\4\4\0034\4\0\0=\4\n\0035\4\v\0=\4\a\0035\4\f\0004\5\n\0009\6\3\0009\6\r\0069\6\14\6>\6\1\0059\6\3\0009\6\r\0069\6\15\6>\6\2\0059\6\3\0009\6\r\0069\6\16\6>\6\3\0059\6\3\0009\6\r\0069\6\17\6>\6\4\0059\6\3\0009\6\r\0069\6\18\6>\6\5\0059\6\3\0009\6\r\0069\6\19\6>\6\6\0059\6\3\0009\6\r\0069\6\20\6>\6\a\0059\6\3\0009\6\r\0069\6\21\6>\6\b\0059\6\3\0009\6\r\0069\6\22\6>\6\t\5=\5\23\4=\4\24\0035\4\27\0009\5\25\0009\5\26\5)\aüÿB\5\2\2=\5\28\0049\5\25\0009\5\26\5)\a\4\0B\5\2\2=\5\29\0043\5\30\0=\5\31\0049\5\25\0009\5 \5B\5\1\2=\5!\0049\5\25\0009\5\"\0055\a#\0B\5\2\2=\5$\0049\5\25\0009\5\"\0055\a%\0B\5\2\2=\5&\4=\4\25\0039\4\3\0009\4'\0044\6\6\0005\a(\0>\a\1\0065\a)\0>\a\2\0065\a*\0>\a\3\0065\a+\0>\a\4\0065\a,\0>\a\5\6B\4\2\2=\4'\3B\1\2\0012\0\0€K\0\1\0\1\0\1\tname\nemoji\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\vsnippy\1\0\1\tname\rnvim_lsp\fsources\n<C-y>\1\0\1\vselect\2\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\0\n<C-d>\n<C-u>\1\0\6\n<C-d>\0\t<CR>\0\n<C-u>\0\n<C-e>\0\n<C-y>\0\14<C-Space>\0\16scroll_docs\fmapping\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\1\0\2\20priority_weight\3\2\16comparators\0\1\0\1\16completeopt\26menu,menuone,noinsert\15formatting\1\0\6\15formatting\0\fmapping\0\vwindow\0\fsorting\0\15completion\0\fsources\0\18documentation\15completion\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n…\2\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0 command! Lex NvimTreeToggle\bcmd\bvim\ffilters\1\0\2\16git_ignored\2\rdotfiles\2\rrenderer\1\0\1\16group_empty\1\tview\1\0\1\nwidth\3#\1\0\4\rrenderer\0\tview\0\ffilters\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: gp.nvim
time([[Config for gp.nvim]], true)
try_loadstring("\27LJ\2\nR\0\1\4\0\3\0\0065\1\0\0'\2\1\0\18\3\0\0&\2\3\2=\2\2\1L\1\2\0\tdesc\16GPT prompt \1\0\4\fnoremap\2\tdesc\0\vsilent\2\vnowait\2.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15LspRestart\bcmd\bvimX\3\0\6\1\4\1\r4\0\3\0G\1\0\0?\1\0\0-\1\0\0006\3\0\0\18\5\0\0B\3\2\0A\1\0\0016\1\1\0009\1\2\0013\3\3\0B\1\2\1K\0\1\0\1À\0\rschedule\bvim\vunpack\3€€À™\4Ð\20\1\0\14\0E\0®\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\4\0006\5\5\0009\5\6\5'\a\a\0B\5\2\2=\5\b\4=\4\n\0035\4\v\0006\5\5\0009\5\6\5'\a\f\0B\5\2\2=\5\b\4=\4\r\3=\3\14\0024\3\a\0005\4\15\0005\5\16\0=\5\17\4'\5\18\0'\6\19\0'\a\20\0'\b\21\0'\t\22\0'\n\23\0'\v\24\0'\f\25\0'\r\26\0&\5\r\5=\5\27\4>\4\1\0035\4\28\0005\5\29\0=\5\17\4'\5\30\0'\6\31\0'\a \0&\5\a\5=\5\27\4>\4\2\0035\4!\0005\5\"\0=\5\17\4'\5\18\0'\6\19\0'\a\20\0'\b\21\0'\t\22\0'\n\23\0'\v\24\0'\f\25\0'\r\26\0&\5\r\5=\5\27\4>\4\3\0035\4#\0>\4\4\0035\4$\0005\5%\0=\5\17\4'\5\30\0'\6\31\0'\a \0&\5\a\5=\5\27\4>\4\5\0035\4&\0>\4\6\3=\3'\2B\0\2\0013\0(\0006\1)\0009\1*\0019\1+\1'\3,\0'\4-\0'\5.\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4-\0'\0050\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0041\0'\0052\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0043\0'\0054\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\0045\0'\0056\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\0047\0'\0058\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\0049\0'\5:\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4;\0'\5<\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4=\0'\5>\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3/\0'\4?\0'\5@\0004\6\0\0B\1\5\0016\1)\0009\1*\0019\1+\1'\3,\0'\4?\0'\5A\0004\6\0\0B\1\5\0016\1)\0009\1B\0019\1C\0016\2)\0009\2B\0023\3D\0=\3C\0022\0\0€K\0\1\0\0\14GpRewrite\afn\29:<C-u>'<,'>GpRewrite<cr>\23<cmd>GpRewrite<cr>\14<leader>k\26<cmd>GpChatFinder<cr>\16<leader>gpf\26<cmd>GpChatToggle<cr>\16<leader>gpt\23<cmd>GpChatNew<cr>\14<leader>c\29:<C-u>'<,'>GpWhisper<cr>\16<leader>gpd$:<C-u>'<,'>GpWhisperRewrite<cr>\16<leader>gpw\31:<C-u>'<,'>GpImplement<cr>\16<leader>gpi\31:<C-u>'<,'>GpChatPaste<cr>\16<leader>gpp\30<cmd>GpChatNew vsplit<cr>\6n$:<C-u>'<,'>GpChatNew vsplit<cr>\16<leader>gpn\6v\20nvim_set_keymap\bapi\bvim\0\vagents\1\0\2\tname\15CodeGPT3-5\fdisable\2\1\0\3\ntop_p\3\1\nmodel\23gpt-4-1106-preview\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\6\tname\rCodeGPT4\nmodel\0\18system_prompt\0\fdisable\2\fcommand\2\tchat\1\1\0\2\tname\15ChatGPT3-5\fdisable\2\1\0\3\ntop_p\3\1\nmodel\23gpt-4-1106-preview\16temperature\4š³æÌ\t™³Æÿ\3\1\0\6\tname\rChatGPT4\nmodel\0\18system_prompt\0\fdisable\2\fcommand\1\tchat\2)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\1\nmodel\31claude-3-5-sonnet-20240620\1\0\5\tname\18CodeSonnet3-5\fcommand\2\18system_prompt\0\nmodel\0\tchat\1\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\1\nmodel\31claude-3-5-sonnet-20240620\1\0\5\tname\14Sonnet3-5\fcommand\1\18system_prompt\0\nmodel\0\tchat\2\14providers\14anthropic\22ANTHROPIC_API_KEY\1\0\2\vsecret\0\rendpoint*https://api.anthropic.com/v1/messages\vopenai\1\0\2\vopenai\0\14anthropic\0\vsecret\19OPENAI_API_KEY\vgetenv\aos\1\0\2\vsecret\0\rendpoint/https://api.openai.com/v1/chat/completions\1\0\3\vagents\0\14providers\0\25chat_topic_gen_model\24gpt-4-turbo-preview\nsetup\agp\frequire\0", "config", "gp.nvim")
time([[Config for gp.nvim]], false)

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
