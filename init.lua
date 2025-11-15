require("config.plugins")
require("config.cmp")
require("config.lsp")
require("config.treesitter")
require("config.lualine")
require('config.telescope')
require('config.ui')
require("config.mappings")
require("config.nvimtree")
require("config.tabline")
require("config.terminal")
require("config.copilot")

vim.cmd [[
  autocmd BufNewFile,BufRead *.blade.php set filetype=blade
]]

