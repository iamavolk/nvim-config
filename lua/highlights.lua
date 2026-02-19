--[[------------------
--   Highlight groups
--]]------------------

local set = vim.api.nvim_set_hl

set(0, 'YankHL', { fg = '#ffffff', bg = '#4f586b' })
-- The separator line visible in vertical splits
set(0, 'WinSeparator', { fg = '#444455' })

if MiniStatusline then
    set(0, 'Modified', { fg = '#ef6902', bg = '#6666aa' })
    set(0, 'MiniStatuslineInactive', { fg = '#444444', bg = '#161616' })
    set(0, 'MiniStatuslineFileinfo', { fg = '#eeeeee', bg = '#3b3b55' })
end
