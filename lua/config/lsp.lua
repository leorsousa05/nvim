local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  "ts_ls",
  "rust_analyzer",
  "pylsp",
  "cssls",
  "lua_ls",
  "emmet_ls",
  "html",
  "prismals",
  "jdtls",
  "tailwindcss",
  "intelephense",
  "jsonls",
  "svelte",
}

for _, server in ipairs(servers) do
  local config = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- Exemplo de keymap para ir à definição
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
      html = {
        format = {
          wrapLineLength = 120,
        },
        filetypes = { "html", "blade", "php" },
      },
      emmet_ls = {
        filetypes = {
          "html", "css", "php", "javascript", "typescriptreact", "javascriptreact", "vue",
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      },
    },
  }

  if server == "intelephense" then
    config.cmd = { "intelephense", "--stdio" }
    config.root_dir = nvim_lsp.util.root_pattern("composer.json", ".git", "artisan")
    config.filetypes = { "php", "blade" }
    config.settings.intelephense = vim.tbl_deep_extend("force", config.settings.intelephense or {}, {
      files = {
        maxSize = 5000000,
      },
      stubs = {
        "apache", "bcmath", "bz2", "calendar", "Core", "ctype", "curl",
        "date", "dba", "dom", "enchant", "exif", "fileinfo", "filter",
        "ftp", "gd", "getopt", "hash", "iconv", "imap", "intl", "json",
        "ldap", "libxml", "mbstring", "mysqli", "mysql", "openssl",
        "pcntl", "pcre", "PDO", "pdo_mysql", "pdo_pgsql", "Phar", "posix",
        "readline", "recode", "reflection", "session", "SimpleXML", "soap",
        "sockets", "sodium", "SPL", "sqlite3", "standard", "tokenizer",
        "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "zip", "zlib"
      },
    })
  end

  nvim_lsp[server].setup(config)
end

