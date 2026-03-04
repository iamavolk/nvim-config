--[[------------------
--   Highlight groups
--]]------------------

local set = vim.api.nvim_set_hl

set(0, 'YankHL', { fg = '#ffffff', bg = '#4f586b' })
set(0, 'WinSeparator', { fg = '#444455' })
set(0, 'IncSearch', { bg = '#faac64', fg = '#000000', bold = true })
set(0, 'CurSearch', { bg = '#faac64', fg = '#000000', bold = true })
set(0, 'Folded', { fg = '#727169' })
set(0, 'LspInlayHint', { bg = '#222222', fg = '#707171' })
set(0, "NormalFloat", { link = "Normal" })
set(0, 'FloatBorder', { fg = '#363646', bg = '#181820', blend = 0 })
set(0, "WhichKeyBorder", { fg = '#999999', bg = '#1f1f28' })
set(0, 'WhichKeyValue', { link = 'MarkdownCode' })
set(0, 'BlinkCmpDoc', { bg = '#181820' })

-- TODO: doesn't work within the plugin's setup. Need to figure out
-- the right place for
if MiniStatusline then
    set(0, 'Modified', { fg = '#ef6902', bg = '#6666aa' })
    set(0, 'MiniStatuslineInactive', { fg = '#777777', bg = '#161616' })
    set(0, 'MiniStatuslineFileinfo', { fg = '#eeeeee', bg = '#3b3b55' })
end
