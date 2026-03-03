return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
        vim.g.no_plugin_maps = true

        -- Or, disable per filetype (add as you like)
        -- vim.g.no_python_maps = true
        -- vim.g.no_ruby_maps = true
        -- vim.g.no_rust_maps = true
        -- vim.g.no_go_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup {
            move = {
                -- whether to set jumps in the jumplist
                set_jumps = false,
            },

            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    -- ['@class.outer'] = '<c-v>', -- blockwise
                },
            },
        }

        vim.keymap.set({ "n", "x", "o" }, "]f", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            vim.api.nvim_feedkeys('o', 'n', false)
        end)

        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            vim.api.nvim_feedkeys('o', 'n', false)
        end)

        vim.keymap.set({ "n", "x", "o" }, "]a", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
            require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
        end)

        vim.keymap.set({ "n", "x", "o" }, "[a", function()
            local cursor = vim.api.nvim_win_get_cursor(0)
            local char = vim.api.nvim_get_current_line():sub(cursor[2] + 1, cursor[2] + 1)
            local pairs = { ['}'] = '{', [']'] = '[', [')'] = '(', ["'"] = "'", ['"'] = '"' }
            local open = pairs[char]
            if open then
                local pos = vim.fn.searchpairpos(open, '', char, 'bn')
                vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] - 1 })
            else
                vim.fn.search('\\<', 'bc')
            end

            require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")

            local new_cursor = vim.api.nvim_win_get_cursor(0)
            local new_char = vim.api.nvim_get_current_line():sub(new_cursor[2] + 1, new_cursor[2] + 1)
            local close_pairs = { ['{'] = '}', ['['] = ']', ['('] = ')' }

            if not close_pairs[new_char] then
                local openers = { { '{', '}' }, { '[', ']' }, { '(', ')' } }
                local best_pos = nil

                for _, pair in ipairs(openers) do
                    local pos = vim.fn.searchpairpos(pair[1], '', pair[2], 'bn')
                    if pos[1] ~= 0 then
                        if best_pos == nil or pos[1] > best_pos[1] or (pos[1] == best_pos[1] and pos[2] > best_pos[2]) then
                            best_pos = pos
                        end
                    end
                end

                if best_pos then
                    vim.api.nvim_win_set_cursor(0, { best_pos[1], best_pos[2] - 1 })
                end
            end

            require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
        end)

        vim.keymap.set({ "n", "x", "o" }, "]s", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@block.inner", "textobjects")
        end)

        vim.keymap.set({ "n", "x", "o" }, "[s", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@block.inner", "textobjects")
        end)

        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
    end,
}
