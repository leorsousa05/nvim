require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "html", "css", "php" },
  highlight = {
    enable = true,
  },
}

