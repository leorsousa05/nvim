
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

