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

require("nvim-autopairs").setup {
    enable_check_bracket_line = true, -- Não fecha pares se a linha estiver vazia
    ignored_next_char = "[%w%.]", -- Ignora caracteres específicos
}

vim.cmd('colorscheme tokyonight')
