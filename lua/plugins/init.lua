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
    use {
        'wbthomason/packer.nvim',
        commit = 'dac4088c70f4337c6c40d1a2751266a324765797',
    }
    use {
        'lewis6991/impatient.nvim',
        commit = '969f2c5c90457612c09cf2a13fee1adaa986d350',
        config = function() require 'plugins.impatient' end,
    }
    use {
        'Mofiqul/vscode.nvim',
        commit = 'dabd5454e88d9ac9f91a5c2f9f6b347410e31162',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        commit = '6f9e5cdba77ff735e8a4b8a9022b23292a41ba95',
        config = function() require 'plugins.treesitter' end,
        run = ':TSUpdate',
    }
    use {
        'hrsh7th/nvim-cmp',
        commit = '8868cf9a09e5f3c2612a22ccb82dcc6d9f0d0d35',
        config = function() require 'plugins.nvim_cmp' end,
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then packer.sync() end
end)
