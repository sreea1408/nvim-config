local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = '',
    })
end

sign { name = 'DiagnosticSignError', text = '✘' }
sign { name = 'DiagnosticSignWarn', text = '' }
sign { name = 'DiagnosticSignHint', text = '' }
sign { name = 'DiagnosticSignInfo', text = '' }

vim.diagnostic.config {
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
}

vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp-nvim-lsp')
if cmp_nvim_lsp_ok then
    local lsp_defaults = lspconfig.util.default_config
    lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        cmp_nvim_lsp.default_capabilities()
    )
end

lspconfig.sumneko_lua.setup {}
lspconfig.clangd.setup {
    cmd = {
        'clangd',
        '--all-scopes-completion',
        '--background-index',
        '--background-index-priority=normal',
        '-j=2',
        '--malloc-trim',
        '--pch-storage=memory',
    },
}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
lspconfig.bashls.setup {}
