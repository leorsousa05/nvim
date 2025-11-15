local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local capabilities = cmp.default_capabilities()

local servers = {
  "intelephense",
  "ts_ls", -- 'ts_ls' está obsoleto, use 'tsserver'
  "pyright",
  "lua_ls",
  "html",
  "cssls",
  "tailwindcss",
  "jsonls",
  "dockerls",
}



local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
              globals = { 'vim' },
            },
          },
        },
      })
    end,
  }
})
