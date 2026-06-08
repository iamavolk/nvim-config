--[[--------------
--   Keybindings
--]] --------------

local set = vim.keymap.set

-- vim.keymap.set('t', '<C-i>', '<C-\\><C-n><cmd>echo bufname("%")<CR>', { noremap = true })
set('n', '<C-x><C-x>', '<cmd>source %<CR>')
set('n', '<Space>x', ':.lua<CR>')
set('v', '<Space>x', ':lua<CR>')

set('n', '<A-n>', ':cnext<CR>')
set('n', '<A-p>', ':cprev<CR>')
set('n', '<C-h>', '<C-x>')
set('t', '<Esc>', '<C-\\><C-n>')

set('i', '<C-Backspace>', '<C-w>', { desc = '' })
set('i', '<C-Space>', '<Space>', { desc = '' })
set('i', '<C-c>', '<Ignore>', { desc = '' })
set('i', '<C-e>', '<End>', { desc = '' })
set('i', '<C-S-e>', '<End>', { desc = '' })
set('i', '<C-a>', '<Home>', { desc = '' })

set('n', '<C-x><C-s>', vim.cmd.update, { desc = 'Emacs-like buffer update' })
set('n', '<C-q><C-q><C-q>', vim.cmd.qall, { desc = '' })
set('n', '<C-p>', ':= ', { desc = '' })

-- set('i', '<A-f>', '<C-o>W', { desc = '' })
-- set('i', '<A-b>', '<C-o>B', { desc = '' })

set({ 'n', 'x', 'o' }, 'gh', '^', { desc = '' })
set({ 'n', 'x', 'o' }, 'gi', '$', { desc = '' })
set({ 'n', 'x', 'o' }, 'ge', 'Gzz', { desc = 'Goto last line and center the view' })

set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Move split windows around
set('n', '<S-Left>', '<C-w>H', { desc = 'Move Left' })
set('n', '<S-Right>', '<C-w>L', { desc = 'Move Right' })
set('n', '<S-Down>', '<C-w>J', { desc = 'Move Down' })
set('n', '<S-Up>', '<C-w>K', { desc = 'Move Up' })

set('n', '<C-k>', '5<C-y>', { desc = '' })
set('n', '<C-.>', '5<C-e>', { desc = '' })

set('n', '<C-j>', function()
    vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'Toggle relativenumber' })

set('n', '<A-l>', function()
    local top = vim.fn.line('w0')
    local bottom = vim.fn.line('w$')
    local mid = math.floor((bottom + top) / 2)

    --@param line: number
    local set_current_line = function(line)
        local curr_col = vim.api.nvim_win_get_cursor(0)[2]
        vim.api.nvim_win_set_cursor(0, { line, curr_col })
    end

    local offset = vim.wo.scrolloff
    local curr_line = vim.fn.line('.')
    local new_line = (bottom <= offset and bottom)
       or (curr_line == bottom - offset and top + offset)
        or (curr_line >= mid and bottom - offset)
        or mid
    set_current_line(new_line)
end, { desc = 'Emacs-like window cycling' })

set('n', '<A-x>', function()
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
end, { desc = 'Line cycling; inspired by Emacs window cycling' })

set('n', '<C-f>', function()
    if vim.fn.getcmdwintype() ~= '' then
        vim.cmd('close')
    else
        vim.api.nvim_feedkeys(':' .. vim.api.nvim_replace_termcodes('<C-f>', true, false, true), 'n', false)
        vim.schedule(function()
            vim.cmd('resize 25')
        end)
        -- vim.cmd('resize 25')
    end
end, { noremap = true, silent = true })

set('n', '<leader>e', function()
  vim.diagnostic.open_float({
    border = 'rounded',
    header = '',
    prefix = '',
  })
end)

set('n', '<leader>m', function()
  require('telescope.builtin').marks({
    layout_strategy = 'center',
    layout_config = {
      width = 0.5,
      height = 0.4,
    },
  })
end)

set('n', '<leader>k', function ()
    vim.lsp.buf.hover({
        -- border = "rounded",
        border = {
            { "╭", "HoverBoard" },
            { "─", "HoverBoard" },
            { "╮", "HoverBoard" },
            { "│", "HoverBoard" },
            { "╯", "HoverBoard" },
            { "─", "HoverBoard" },
            { "╰", "HoverBoard" },
            { "│", "HoverBoard" },
        },
    })
end)
vim.api.nvim_set_hl(0, "HoverBoard", { fg = "#aaaaaa" })

set('n', '<leader>d', function()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = not config.virtual_text and {
            prefix = ' 󰃤',
        }
    })
end)

set('n', '<leader>zz', ':VimadeToggle<CR>', { desc = '[T]oggle [V]imade (window tint)' })
set('n', '<leader>tt', ':term<CR>', { desc = '' })
set('n', '<C-w><C-t>', ':tabnew<CR>', { desc = 'new [t]ab' })
set({'n', 'o'}, ')', 'gt',  { desc = '' })
set({'n', 'o'}, '(', 'gT',  { desc = '' })

set("n", "kd", "<Plug>(nvim-surround-delete)", {
    desc = "Delete a surrounding pair",
})
set("n", "ks", "<Plug>(nvim-surround-change)", {
    desc = "Change a surrounding pair",
})
set("x", "k", "<Plug>(nvim-surround-visual)", {
    desc = "Add a surrounding pair around a visual selection",
})

vim.keymap.set('i', '<C-l>', function ()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line, line, false, {''})
end, { desc = '' })

-- vim.keymap.set('n', '/', function()
--     local top_line = vim.fn.line('w0') - 1
--     local bottom_line = vim.fn.line('w$') + 1
--     return '/\\%>' .. top_line .. 'l\\%<' .. bottom_line .. 'l'
-- end, { expr = true, desc = "Search in viewport; requires incsearch to be off for ergonomics" })

vim.keymap.set('n', '<C-m>', function() 
    if vim.fn.getcmdwintype() == ":" then 
        vim.api.nvim_feedkeys("\r", "n", false)
        return
    end
    vim.api.nvim_feedkeys('van', '', false)
end, {})

vim.keymap.set('v', '<C-m>', function() 
    vim.api.nvim_feedkeys('an', 'v', false)
end, {})


vim.keymap.set('n', '<C-n>', function()
    vim.api.nvim_feedkeys('vin', 'n', false)
end, {})

vim.keymap.set('v', '<C-n>', function() 
    vim.api.nvim_feedkeys('in', 'v', false)
end, {})
