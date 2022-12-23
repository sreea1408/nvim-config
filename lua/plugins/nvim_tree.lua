local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then return end

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})

local custom_mappings = {
    { key = { 'l', '<CR>', '<2-LeftMouse>' }, action = 'edit' },
    { key = 'v', action = 'vsplit' },
    { key = 's', action = 'split' },
    { key = 't', action = 'tabnew' },
    { key = 'h', action = 'close_node' },
    { key = 'R', action = 'refresh' },
    { key = 'r', action = 'rename' },
    { key = 'C', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 'ca', action = 'collapse_all' },
}

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        signcolumn = 'yes',
        mappings = {
            custom_only = true,
            list = custom_mappings,
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                git = {
                    unstaged = '✗',
                    staged = '✓',
                    unmerged = '',
                    renamed = '➜',
                    untracked = 'U',
                    deleted = '',
                    ignored = '◌',
                },
            },
        },
        special_files = {},
        symlink_destination = false,
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    ignore_ft_on_setup = {},
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            error = '✘',
            warning = '',
            hint = '',
            info = '',
        },
    },
    git = {
        ignore = false,
        timeout = 500,
    },
}

vim.g.nvim_tree_respect_buf_cwd = 1
