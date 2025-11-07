local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost lua/config/plugins.lua source <afile> | PackerSync
augroup end
]])

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

	use 'folke/tokyonight.nvim'

	use 'mason-org/mason.nvim'
	use 'mason-org/mason-lspconfig.nvim'

	use {
		"hrsh7th/nvim-cmp", -- Autocompletar
		requires = {
			"hrsh7th/cmp-buffer", -- Completar do buffer
			"hrsh7th/cmp-path",   -- Completar caminhos de arquivos
			"hrsh7th/cmp-nvim-lsp", -- Completar do LSP
			"hrsh7th/cmp-vsnip",  -- Integração com vsnip
			"hrsh7th/vim-vsnip",  -- vsnip (snippets)
			"rafamadriz/friendly-snippets", -- Snippets pré-configurados
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'nvim-lualine/lualine.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', 
		},
	}

	use {
		'akinsho/nvim-bufferline.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'

	use {
		"windwp/nvim-autopairs",
		config = function ()
			require("nvim-autopairs").setup {}
		end
	}

	use { "ellisonleao/gruvbox.nvim" }

	use {
		"Exafunction/windsurf.nvim",
		requires = {
			"hrsh7th/nvim-cmp",
		},
	}


	if packer_bootstrap then
		require('packer').sync()
	end
end)
