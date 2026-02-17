return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local lsp = require("lspconfig")
		local cmp = require("cmp_nvim_lsp")
		local capabilities = cmp.default_capabilities()

		local servers = {
			"intelephense",
			"pyright",
			"lua_ls",
			"html",
			"cssls",
			"tailwindcss",
			"jsonls",
			"dockerls",
		}

		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		end

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = servers,

			handlers = {
				function(server_name)
					lsp[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					lsp.lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})
	end,
}

