local ok, notify = pcall(require, 'notify')
if not ok then return end

notify.setup {
    stages = 'static',
}

vim.notify = notify
