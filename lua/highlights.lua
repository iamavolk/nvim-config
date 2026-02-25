--[[------------------
--   Highlight groups
--]]------------------

local set = vim.api.nvim_set_hl

set(0, 'YankHL', { fg = '#ffffff', bg = '#4f586b' })
-- The separator line visible in vertical splits
set(0, 'WinSeparator', { fg = '#444455' })

-- TODO: doesn't work within the plugin's setup. Need to figure out
-- the right place for
if MiniStatusline then
    set(0, 'Modified', { fg = '#ef6902', bg = '#6666aa' })
    set(0, 'MiniStatuslineInactive', { fg = '#444444', bg = '#161616' })
    set(0, 'MiniStatuslineFileinfo', { fg = '#eeeeee', bg = '#3b3b55' })
end

-- Flash-like (or, Helix's gw -like) behavior can simply be done
-- with idiomatic buffer-wide search with just a tiny bit more
-- speed typing. And to aid with that we need to add some visual cues

set(0, 'IncSearch', { bg = '#faac64', fg = '#000000', bold = true })
set(0, 'CurSearch', { bg = '#faac64', fg = '#000000', bold = true })
