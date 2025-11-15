require('tokyonight').setup({
  style = 'night',
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
})

vim.o.number = true
vim.o.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

require("nvim-autopairs").setup {
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]",
}

vim.cmd("colorscheme tokyonight")
