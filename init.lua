vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
vim.g.wildcat_java_home = "C:\\Program Files\\Java\\jdk-21"

require("config.ui")
require("config.mappings")
require("lazy").setup("plugins")
