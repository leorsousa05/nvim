local cmp = require('cmp')

-- Função auxiliar para ver se há texto antes do cursor
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    if col == 0 then return false end
    local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    return text:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- Usa vsnip para expandir snippets
        end,
    },

    mapping = {

        -- Scroll da documentação
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

        -- Abrir autocomplete manualmente
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

        -- Desabilita confirmação automática com C-y
        ['<C-y>'] = cmp.config.disable,

        -- Fechar autocomplete
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- Confirmar com Enter
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Navegar para próximo item do menu
        ['<C-n>'] = cmp.mapping(function(fallback)
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
        end, { 'i', 's' }),

        -- Navegar para item anterior do menu
        ['<C-p>'] = cmp.mapping(function(fallback)
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
        end, { 'i', 's' }),

        -- ===============================
        -- TAB APENAS PARA COMPLETAR
        -- ===============================
        ['<Tab>'] = cmp.mapping(function(fallback)
            -- Se tiver palavra antes → abre o autocomplete
            if has_words_before() then
                cmp.complete()
            else
                -- Caso contrário → TAB normal
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            fallback() -- comportamento padrão do Shift+Tab
        end, { 'i', 's' }),
    },

    -- Fontes do autocomplete
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

