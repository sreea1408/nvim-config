local ok, indent_blankline = pcall(require, 'indent_blankline')
if not ok then return end

indent_blankline.setup {
    buftype_exclude = {
        'nofile',
        'terminal',
    },
    filetype_exclude = {
        'help',
        'packer',
        'NvimTree',
    },
    show_end_of_line = true,
}
