vim.g.mapleader = "\\"


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("i", "<A-e>", "<ESC>", opts)
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)  -- Abrir Telescope para encontrar arquivos
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Ir para a definição (LSP)
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)   -- Mostrar documentação (LSP)
keymap("n", "<C-g>", ":lua require('config.git_modal').git_modal()<CR>", { noremap = true, silent = true })
keymap("n", "<C-s>", ":w!<CR>", opts)
keymap("n", "<C-g>", ":lua require('config.git').open_git_modal()<CR>", opts)  -- Abrir modal do Git
