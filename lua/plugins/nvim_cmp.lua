local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end

local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
local format_fallback = function(entry, item)
    local menu_icon = {
        nvim_lsp = 'λ',
        buffer = 'Ω',
        path = '🖫',
    }
    item.menu = menu_icon[entry.source.name]
    return item
end

cmp.setup {
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspkind_status_ok
                and lspkind.cmp_format { lspkind.SYMBOL_MAP }
            or format_fallback,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<Tab>'] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select,
        },
        ['<S-Tab>'] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select,
        },
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    sources = {
        {
            name = 'nvim_lsp',
            keyword_length = 3,
            entry_filter = function(entry)
                return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Snippet
            end,
        },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
}
