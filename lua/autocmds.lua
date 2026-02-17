--[[--------------
--   Autocommands
--]]--------------

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Line numbers in help files',
    pattern = 'help',
    callback = function()
        vim.opt.number = true
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking',
    callback = function()
        vim.hl.on_yank({ higroup = 'YankHL' })
    end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    desc = 'Cursor line within focused pane',
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

vim.api.nvim_create_autocmd({'WinLeave'}, {
    desc = 'No cursor line while unfocused',
    callback = function()
        vim.opt_local.cursorline = false
    end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
    desc = 'Enable relative numbers only in visual and operator pending modes',
    pattern = {'*:no', '*:v', '*:V', '*:\x16'},
    callback = function()
        vim.opt.relativenumber = true
    end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
    desc = 'Disable relative numbers when leaving visual/operator pending mode',
    pattern = {'no:n', 'v:n', 'V:n', '\x16:n'},
    callback = function()
        vim.opt.relativenumber = false
    end,
})
