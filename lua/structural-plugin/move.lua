local shared = require("nvim-treesitter-textobjects.shared")
local global_config = require("structural-plugin.config")
local ts = vim.treesitter
local ts_range = vim.treesitter._range

local M = {}

local function printtest(...)
    print(vim.inspect(...))
end

M.move_next = function()
    local winid = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_win_get_buf(winid)

    local parser = ts.get_parser(bufnr)
    local tree = parser:parse()[1]
    local root = tree:root()

    local lang = parser:lang()

    local query = vim.treesitter.query.get(lang, "textobjects")
    -- printtest(query)
    if not query then
        return
    end

    local cursor = vim.api.nvim_win_get_cursor(winid)
    local cur_row = cursor[1] - 1
    local cur_col = cursor[2]

    for id, node, metadata in query:iter_captures(root, bufnr, cur_row, -1) do
        local capture = query.captures[id]
        if capture == "function.outer" then
            local sr, sc, er, ec = node:range()

            local after_cursor = sr > cur_row or (sr == cur_row and sc > cur_col)

            if after_cursor then
                -- vim.fn.setpos("'<", { bufnr, sr + 1, sc + 1, 0 })
                -- vim.fn.setpos("'>", { bufnr, er + 1, ec, 0 })
                -- vim.cmd("normal! gv")
                vim.api.nvim_win_set_cursor(winid, { sr + 1, sc })
                M.fade_apply(sr, er + 1)
                return
            end
        end
    end
end

M.move_prev = function()
    local winid = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_win_get_buf(winid)

    local parser = ts.get_parser(bufnr)
    local tree = parser:parse()[1]
    local root = tree:root()

    local lang = parser:lang()

    local query = vim.treesitter.query.get(lang, "textobjects")
    if not query then
        return
    end

    local cursor = vim.api.nvim_win_get_cursor(winid)
    local cur_row = cursor[1] - 1
    local cur_col = cursor[2]

    local prev_node = nil

    for id, node, metadata in query:iter_captures(root, bufnr, 0, -1) do
        local capture = query.captures[id]
        if capture == "function.outer" then
            local sr, sc, er, ec = node:range()

            local is_before_cursor = sr < cur_row or (sr == cur_row and sc < cur_col)

            if is_before_cursor then
                prev_node = node
            else
                break
            end
        end
    end

    if prev_node then
        local sr, sc, er, ec = prev_node:range()
        vim.api.nvim_win_set_cursor(winid, { sr + 1, sc })
        M.fade_apply(sr, er + 1)
        return
    end
end

M.parse_next_func = function()
    local winid = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_win_get_buf(winid)

    local parser = ts.get_parser(bufnr)
    local tree = parser:parse()[1]
    local root = tree:root()

    local query = vim.treesitter.query.parse(
        parser:lang(),
        [[
        (function_definition
          body: (block)? @function.inner) @function.outer
    ]]
    )

    for id, node, metadata in query:iter_captures(root, bufnr, 0) do
        vim.print({ node:type(), vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf()) })
    end
end

local my_ns_id = vim.api.nvim_create_namespace("MyFader")
local faded = nil
vim.api.nvim_set_hl(0, "MyFadedText", { fg = "#1f1f28" })

M.fade_proof = function()
    local buffer_nr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(buffer_nr, my_ns_id, 0, -1)

    vim.api.nvim_buf_set_extmark(buffer_nr, my_ns_id, 0, 0, {
        end_row = 22,
        hl_group = "MyFadedText",
    })

    vim.api.nvim_buf_set_extmark(buffer_nr, my_ns_id, 40, 0, {
        end_row = vim.api.nvim_buf_line_count(buffer_nr),
        hl_group = "MyFadedText",
    })

    faded = true
end

M.fade_apply = function(srow, erow)
    local buffer_nr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(buffer_nr, my_ns_id, 0, -1)

    vim.api.nvim_buf_set_extmark(buffer_nr, my_ns_id, 0, 0, { end_row = srow, hl_group = "MyFadedText" })
    vim.api.nvim_buf_set_extmark(
        buffer_nr,
        my_ns_id,
        erow,
        0,
        { end_row = vim.api.nvim_buf_line_count(buffer_nr), hl_group = "MyFadedText" }
    )

    faded = true
end

M.get_enclosing_function_node = function()
    -- Hash map lookup is faster than array's
    -- Hence the corresponding data structure
    local node_types = {
        ["function_definition"] = true,
        ["function_declaration"] = true,
    }

    local node = vim.treesitter.get_node()
    if not node then
        return nil
    end

    while node do
        if node_types[node:type()] then
            return node
        end
        node = node:parent()
    end
    return nil
end

M.fade_current = function()
    local function_node = M.get_enclosing_function_node()
    if function_node then
        local sr, sc, er, ec = function_node:range()
        M.fade_apply(sr, er + 1)
    end
end

M.fade_remove = function()
    local buffer_nr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(buffer_nr, my_ns_id, 0, -1)
    faded = false
end

M.toggle_fade = function()
    if faded then
        M.fade_remove()
    else
        M.fade_current()
    end
end

return M
