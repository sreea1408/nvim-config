local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

gitsigns.setup {
    signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '契' },
        topdelete = { text = '契' },
        changedelete = { text = '契' },
        untracked = { text = '▎' },
    },
}
