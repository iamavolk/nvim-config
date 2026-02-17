--[[--------------
--   Keybindings
--]]--------------

vim.keymap.set('i', '<C-Backspace>','<C-w>', { desc = '' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = '' })

vim.keymap.set('n', '<C-x><C-s>', vim.cmd.update, { desc = 'Emacs-like buffer update' })
vim.keymap.set('n', '<C-q><C-q><C-q>', vim.cmd.qall, { desc = '' })
vim.keymap.set('n', '<C-s><C-s><C-s>', function() vim.print('sourced'); vim.cmd.source() end, { desc = '' })
vim.keymap.set('n', '<C-p>', ':= ', { desc = '' })

-- Below keymaps creatively expand on the default ones
-- taking advantage of the underutilized Meta/Alt namespace
vim.keymap.set('i', '<A-f>', '<C-o>W', { desc = '' })
vim.keymap.set('i', '<A-b>', '<C-o>B', { desc = '' })
vim.keymap.set('i', '<C-a>', '<C-o>0', { desc = '' })

vim.keymap.set('n', '<A-q>', '^', { desc = '' })
vim.keymap.set('n', '<A-c>', '$', { desc = '' })
vim.keymap.set('n', '<A-g><A-g>', 'Gzz', { desc = 'Goto last line and center the view' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('n', '<leader>o', '<cmd>Oil --float<CR>', { desc = 'Open Explorer' })

-- Move split windows around
vim.keymap.set('n', '<S-Left>', '<C-w>H', { desc = 'Move Left' })
vim.keymap.set('n', '<S-Right>', '<C-w>L', { desc = 'Move Right' })
vim.keymap.set('n', '<S-Down>', '<C-w>J', { desc = 'Move Down' })
vim.keymap.set('n', '<S-Up>', '<C-w>K', { desc = 'Move Up' })

vim.keymap.set('n', '<C-k>', '5<C-y>', { desc = '' })
vim.keymap.set('n', '<C-.>', '5<C-e>', { desc = '' })

vim.keymap.set('n', '<C-j>', function()
    vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'Toggle relativenumber' })

--
--
local cycle_cursor_v = function()
    local top = vim.fn.line('w0')
    local bottom = vim.fn.line('w$')
    local mid = math.floor((bottom + top) / 2)

    --@param line: number
    local set_current_line = function(line)
        local curr_col = vim.api.nvim_win_get_cursor(0)[2]
        vim.api.nvim_win_set_cursor(0, {line, curr_col})
    end

    local offset = vim.wo.scrolloff
    local curr_line = vim.fn.line('.')
    local new_line = (bottom <= offset and bottom)
                     or (curr_line == bottom - offset and top + offset)
                     or (curr_line >= mid and bottom - offset)
                     or mid
    set_current_line(new_line)
end

--
--
local cycle_cursor_h = function()
    local t = vim.api.nvim_get_current_line()
    local first = t:find("%S") or 0
    local last = #t or 0

    local first_third = math.floor(first + (last - first) / 3)
    local second_third = math.floor(first + 2 * (last - first) / 3)

    local curr_col = vim.api.nvim_win_get_cursor(0)[2]
    local new_col = (curr_col == last - 1 and first - 1)
                    or (curr_col >= second_third and last)
                    or (curr_col >= first_third and second_third)
                    or first_third

    vim.api.nvim_win_set_cursor(0, {
        vim.api.nvim_win_get_cursor(0)[1],
        new_col
    })
end

vim.keymap.set('n', '<A-l>', cycle_cursor_v, { desc = 'Emacs-like window cycling' })
vim.keymap.set('n', '<A-x>', cycle_cursor_h, { desc = 'Line cycling' })
vim.keymap.set('i', '<C-Space>', '<Ignore>')

