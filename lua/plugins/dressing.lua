local ok, dressing = pcall(require, 'dressing')
if not ok then return end

dressing.setup {
    input = {
        default_prompt = '➤ ',
        relative = 'editor',
        win_options = { winhighlight = 'Normal:Normal,NormalNC:Normal' },
    },
    select = {
        backend = { 'telescope', 'builtin' },
        builtin = {
            win_options = { winhighlight = 'Normal:Normal,NormalNC:Normal' },
        },
    },
}
