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
    b = {
        '<cmd>Telescope buffers<cr>',
        'Buffers',
    },
    e = {
        '<cmd>NvimTreeToggle<CR>',
        'Explorer',
    },
    f = {
        name = 'Find',
        -- https://www.reddit.com/r/neovim/comments/ol62vb/how_to_disable_telescopes_file_previewer/
        f = {
            "<cmd>lua require('telescope.builtin').find_files { previewer = false }<cr>",
            'Files',
        },
        s = {
            name = 'String',
            i = {
                "<cmd>lua require('telescope.builtin').live_grep { vimgrep_arguments = { 'rg', '-L', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--ignore-case' } }<cr>",
                'Case insensitive and not exact match',
            },
            I = {
                "<cmd>lua require('telescope.builtin').live_grep { vimgrep_arguments = { 'rg', '-L', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--ignore-case', '-w' } }<cr>",
                'Case insensitive and exact match',
            },
            s = {
                "<cmd>lua require('telescope.builtin').live_grep { vimgrep_arguments = { 'rg', '-L', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--case-sensitive' } }<cr>",
                'Case sensitive and not exact match',
            },
            S = {
                "<cmd>lua require('telescope.builtin').live_grep { vimgrep_arguments = { 'rg', '-L', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--case-sensitive', '-w' } }<cr>",
                'Case sensitive and exact match',
            },
        },
    },
    g = {
        name = 'Git',
        b = { '<cmd>GitBlameToggle<cr>', 'Blame Toggle' },
        B = {
            "<cmd>lua require 'gitsigns'.blame_line({full = true})<cr>",
            'Blame Full',
        },
        n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
        p = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
        P = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            'Undo Stage Hunk',
        },
    },
    h = {
        '<cmd>nohlsearch<CR>',
        'No Highlight',
    },
    l = {
        name = 'LSP',

        -- Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
        d = { '<cmd>Telescope lsp_definitions<cr>', 'Definition' },

        -- Jump to the declaration
        D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },

        -- Show diagnostics in a floating window
        f = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Float diagnostic' },

        -- Displays hover information about the symbol under the cursor
        h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },

        -- Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
        i = { '<cmd>Telescope lsp_implementations<cr>', 'Implementation' },

        -- Lists LSP incoming calls for word under the cursor, jumps to reference on `<cr>`
        I = { '<cmd>Telescope lsp_incoming_calls<cr>', 'Incoming calls' },

        -- Move to the next diagnostic
        n = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic' },

        -- Move to the previous diagnostic
        p = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Prev diagnostic' },

        -- Lists LSP references for word under the cursor, jumps to reference on `<cr>`
        r = { '<cmd>Telescope lsp_references<cr>', 'References' },

        -- Renames all references to the symbol under the cursor
        R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },

        -- Lists LSP document symbols in the current buffer
        s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },

        -- Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
        t = { '<cmd>Telescope lsp_type_definitions<cr>', 'Type Definition' },
    },
    m = {
        '<cmd>Mason<cr>',
        'Mason',
    },
    M = {
        name = 'Misc',
        m = { '<cmd>MarkdownPreviewToggle<cr>', 'Markdown Preview Toggle' },
        s = { '<cmd>Telescope treesitter<cr>', 'Document Symbols (Treesitter)' },
        t = { '<cmd>set relativenumber!<cr>', 'Toggle relative line number' },
    },
    p = {
        name = 'Packer',
        c = { '<cmd>PackerCompile<cr>', 'Compile' },
        s = { '<cmd>PackerSync<cr>', 'Sync' },
        S = { '<cmd>PackerStatus<cr>', 'Status' },
    },
    r = {
        '<cmd>Telescope resume<cr>',
        'Resume Search',
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
