-- ============================================
--  PACKER BOOTSTRAP
-- ============================================

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function ensure_packer()
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git", "clone", "--depth", "1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd("packadd packer.nvim")
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- ============================================
--  AUTO RELOAD DO ARQUIVO DE PLUGINS
-- ============================================

vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "packer_user_config",
	pattern = "lua/config/plugins.lua",
	command = "source <afile> | PackerSync",
})

-- ============================================
--  PACKER SETUP
-- ============================================

return require("packer").startup(function(use)
	-------------------------------------------------------
	-- Packer pode gerenciar ele mesmo
	-------------------------------------------------------
	use("wbthomason/packer.nvim")

	-------------------------------------------------------
	-- LSP
	-------------------------------------------------------
	use("neovim/nvim-lspconfig")
	use("mason-org/mason.nvim")
	use("mason-org/mason-lspconfig.nvim")

	-------------------------------------------------------
	-- Temas
	-------------------------------------------------------
	use("folke/tokyonight.nvim")

	-------------------------------------------------------
	-- Autocomplete + Snippets
	-------------------------------------------------------
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
		},
	})

	-------------------------------------------------------
	-- Treesitter
	-------------------------------------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-------------------------------------------------------
	-- UI: Statusline, bufferline, filetree, telescope
	-------------------------------------------------------
	use("nvim-lualine/lualine.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-------------------------------------------------------
	-- Git
	-------------------------------------------------------
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-------------------------------------------------------
	-- Autopairs
	-------------------------------------------------------
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-------------------------------------------------------
	-- Terminal
	-------------------------------------------------------
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
	}


	-------------------------------------------------------
	-- Autocomplete AI
	-------------------------------------------------------
	use "github/copilot.vim"

	-------------------------------------------------------
	-- Instalar ao bootstrapar
	-------------------------------------------------------
	if packer_bootstrap then
		require("packer").sync()
	end
end)

