local ok, which_key = pcall(require, 'which-key')
if not ok then return end

local opts = {
    mode = 'n', -- NORMAL mode
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    h = {
        '<cmd>nohlsearch<CR>',
        'No Highlight',
    },
    n = {
        '<cmd>set relativenumber!<cr>',
        'Toggle relative line number',
    },
    p = {
        name = 'Packer',
        c = { '<cmd>PackerCompile<cr>', 'Compile' },
        s = { '<cmd>PackerSync<cr>', 'Sync' },
        S = { '<cmd>PackerStatus<cr>', 'Status' },
    },
}

which_key.setup {
    icons = {
        group = '', -- symbol prepended to a group
    },
    window = {
        border = 'rounded', -- none, single, double, shadow
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
}

which_key.register(mappings, opts)
