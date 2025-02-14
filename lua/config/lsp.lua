local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local capabilities = cmp.default_capabilities()


local servers = {
  "intelephense", 
  "ts_ls",     
  "pyright",      
  "gopls",        
  "rust_analyzer",
  "solargraph",   
  "lua_ls",  
  "html",         
  "cssls",        
  "tailwindcss",  
  "jsonls",       
  "dockerls",     
  "bashls",       
  "marksman",     
}


for _, server in ipairs(servers) do
  lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end


lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    source = "always",
  },
})
