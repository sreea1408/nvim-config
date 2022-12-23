local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup {
    ensure_installed = 'all',
    sync_install = false,
    auto_install = true,
    ignore_install = { '' },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
