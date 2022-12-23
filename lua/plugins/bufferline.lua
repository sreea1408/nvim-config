local ok, bufferline = pcall(require, 'bufferline')
if not ok then return end

bufferline.setup {
    options = {
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete %d',
        diagnostics = 'nvim_lsp',
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(
            count,
            level,
            diagnostics_dict,
            context
        )
            return '(' .. count .. ')'
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'left',
                separator = true,
            },
        },
        hover = {
            enabled = false,
        },
        sort_by = 'insert_after_current',
    },
}
