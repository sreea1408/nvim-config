local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath 'data'
        .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path,
        }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    -- Plugin manager
    use {
        'wbthomason/packer.nvim',
        commit = 'dac4088c70f4337c6c40d1a2751266a324765797',
    }
    use {
        'williamboman/mason.nvim',
        commit = '3ccd16bac090a995685e3bbc0bacf658bc001314',
        config = function() require 'plugins.mason' end,
    }

    use {
        'lewis6991/impatient.nvim',
        commit = '969f2c5c90457612c09cf2a13fee1adaa986d350',
        config = function() require 'plugins.impatient' end,
    }

    -- Theme
    use {
        'Mofiqul/vscode.nvim',
        commit = 'dabd5454e88d9ac9f91a5c2f9f6b347410e31162',
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        commit = '6f9e5cdba77ff735e8a4b8a9022b23292a41ba95',
        config = function() require 'plugins.treesitter' end,
        run = ':TSUpdate',
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        commit = '2ab3bdf0a40bab53033048c6be75bda86316b55d',
        config = function() require 'plugins.gitsigns' end,
    }

    -- icons/pictograms
    use {
        'onsails/lspkind.nvim',
        commit = 'c68b3a003483cf382428a43035079f78474cd11e',
        config = function() require 'plugins.lspkind' end,
    }
    use {
        'nvim-tree/nvim-web-devicons',
        commit = '05e1072f63f6c194ac6e867b567e6b437d3d4622',
    }

    -- snippet
    use {
        'L3MON4D3/LuaSnip',
        commit = '8b25e74761eead3dc47ce04b5e017fd23da7ad7e',
    }

    -- cmp
    use {
        'hrsh7th/nvim-cmp',
        commit = '8868cf9a09e5f3c2612a22ccb82dcc6d9f0d0d35',
        config = function() require 'plugins.nvim_cmp' end,
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        commit = '59224771f91b86d1de12570b4070fe4ad7cd1eeb',
    }

    -- LSP
    use {
        'williamboman/mason-lspconfig.nvim',
        commit = '5bea0e851b8f48479d2cb927cd26733b4058b2b3',
        config = function() require 'plugins.mason_lspconfig' end,
    }
    use {
        'neovim/nvim-lspconfig',
        commit = '22c87d6f48c4fb1daf33476450d0b14a64230809',
        config = function() require 'plugins.nvim_lspconfig' end,
    }

    -- Misc
    use {
        'nvim-tree/nvim-tree.lua',
        commit = '87409bb4afd0093193e1364faa47327fbfdfca87',
        config = function() require 'plugins.nvim_tree' end,
    }
    use {
        'akinsho/bufferline.nvim',
        commit = '4ecfa81e470a589e74adcde3d5bb1727dd407363',
        config = function() require 'plugins.bufferline' end,
    }
    use {
        'tiagovla/scope.nvim',
        commit = '2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875',
        config = function() require 'plugins.scope' end,
    }
    use {
        'folke/which-key.nvim',
        commit = '61553aeb3d5ca8c11eea8be6eadf478062982ac9',
        config = function() require 'plugins.which_key' end,
    }
    use {
        'rcarriga/nvim-notify',
        commit = 'b005821516f1f37801a73067afd1cef2dbc4dfe8',
        config = function() require 'plugins.notify' end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        commit = 'c4c203c3e8a595bc333abaf168fcb10c13ed5fb7',
        config = function() require 'plugins.indent_blankline' end,
        after = 'nvim-treesitter',
    }
    use {
        'windwp/nvim-autopairs',
        commit = 'b5994e6547d64f781cfca853a1aa6174d238fe0e',
        config = function() require 'plugins.autopairs' end,
        after = 'nvim-cmp',
    }
    use {
        'nvim-lualine/lualine.nvim',
        commit = 'fffbcb829288c3ca366f17cdb8d46aefb5c1d6f3',
        config = function() require 'plugins.lualine' end,
    }
    use {
        'nvim-lua/plenary.nvim',
        commit = '4b7e52044bbb84242158d977a50c4cbcd85070c7',
    }
    use {
        'nvim-telescope/telescope.nvim',
        commit = 'e960efa60e97df58e089b00270f09d60f27202c8',
        config = function() require 'plugins.telescope' end,
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        commit = 'fab3e2212e206f4f8b3bbaa656e129443c9b802e',
        run = 'make',
    }
    use {
        'stevearc/dressing.nvim',
        commit = '4436d6f41e2f6b8ada57588acd1a9f8b3d21453c',
        config = function() require 'plugins.dressing' end,
    }
    use {
        'iamcco/markdown-preview.nvim',
        commit = '02cc3874738bc0f86e4b91f09b8a0ac88aef8e96',
        run = 'cd app && npm install',
        setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' },
    }
    use {
        'f-person/git-blame.nvim',
        commit = 'd3afb1c57918720548effb42edec530232436378',
        setup = function()
            -- https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua#L364
            vim.g.gitblame_message_template = '<author>, <summary> • <date>'
            vim.g.gitblame_date_format = '%r'
            vim.g.gitblame_highlight_group = 'gitcommitComment'
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then packer.sync() end
end)
