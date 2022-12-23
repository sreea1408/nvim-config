local ok, telescope = pcall(require, 'telescope')
if not ok then return end

actions = require 'telescope.actions'

-- show line numbers in telescope preview
vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'

telescope.setup {
    defaults = {
        preview = {
            timeout = 500,
        },
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },
        mappings = {
            i = {
                ['<C-d>'] = actions.delete_buffer,
            },
            n = {
                ['<C-d>'] = actions.delete_buffer,
            },
        },
    },
}

telescope.load_extension 'fzf'
