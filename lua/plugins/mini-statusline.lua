return {
    'echasnovski/mini.statusline',
    config = function()

        local statusline = require("mini.statusline")
        local custom_active = function()

            local function set_filename(options)
                -- modes
                local modes = {
                    modified = function() return vim.bo.modified and '🎯' or '' end,
                    terminal = function () return vim.bo.buftype == 'terminal' end,
                    small_window = function() return statusline.is_truncated(options.trunc_width) end,
                }

                -- filename string
                local fstring =
                (modes.small_window() and '%f' or '%F') .. ' ' ..
                (modes.modified()) ..
                '%r'

                return modes.terminal() and '%t' or fstring
            end

            local function set_location()
                return '%l:%L 󰇝 %2v:%-2{virtcol("$") - 1}'
            end

            local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
            local diff          = statusline.section_diff({ trunc_width = 75, icon = '󱁻' })
            local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
            local filename      = set_filename({ trunc_width = 140 })
            local git           = statusline.section_git({ trunc_width = 50 })
            local location      = set_location()
            local lsp           = statusline.section_lsp({ trunc_width = 75, icon = '✨' })
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local search        = statusline.section_searchcount({ trunc_width = 75 })

            -- print(MiniStatusline == statusline)
            return MiniStatusline.combine_groups({
                { hl = mode_hl,                  strings = { mode } },
                { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics, lsp } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { search, location } },
            })
        end

        statusline.setup({
            use_icons = true,
            content = {
                active = custom_active,
            },
        })
    end
}
-- vim: ts=4 sts=4 sw=4 et
