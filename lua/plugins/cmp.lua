return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local cmp = require("cmp")

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      if col == 0 then return false end
      local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
      return text:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },

      mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn == 1 then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true),
              ""
            )
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true),
              ""
            )
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
      },
    })
  end,
}

