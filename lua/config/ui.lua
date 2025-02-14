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

vim.cmd('colorscheme tokyonight')
