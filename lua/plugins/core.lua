return {
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },

  {
    "nvim-tree/nvim-web-devicons",
	lazy = false,
	priority = 998
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
  },

  -- Copilot
  { "github/copilot.vim" },
}

