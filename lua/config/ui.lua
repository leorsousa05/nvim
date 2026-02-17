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
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
  silent = true,
  expr = true,
})
vim.g.copilot_enabled = 1
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
  markdown = true,
  gitcommit = true,
  ["*"] = true,
}

require("nvim-autopairs").setup {
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]",
}
