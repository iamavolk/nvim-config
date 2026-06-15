--[[--------------
--   Keybindings
--]]
--------------

local set = vim.keymap.set

set("n", "<C-s><C-x>", "<cmd>source %<CR>")
set("n", "<Space>x", ":.lua<CR>")
set("v", "<Space>x", ":lua<CR>")
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
set("n", "<leader>jj", function()
    if not vim.g.day then
        vim.cmd.colorscheme("koda-light")
        vim.g.day = true
    else
        vim.cmd.colorscheme("kanagawa-paper-ink")
        vim.g.day = false
    end
end, { desc = "" })

set("n", "<A-n>", ":cnext<CR>", { desc = "Quickfix navigation" })
set("n", "<A-p>", ":cprev<CR>", { desc = "Quickfix navigation" })
set("t", "<Esc>", "<C-\\><C-n>")
set("n", "<C-w><C-t>", ":tabnew<CR>", { desc = "New tab" })
set({ "n", "o" }, ")", "gt", { desc = "Next tab" })
set({ "n", "o" }, "(", "gT", { desc = "Prev tab" })

set("i", "<C-Backspace>", "<C-w>", { desc = "" })
set("i", "<C-Space>", "<Space>", { desc = "This has to do with keyd daemon quirks" })
set("i", "<C-a>", "<C-Left>", { desc = "Move left by word w/o leaving Insert Mode" })

set("i", "<C-e>", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    local next_char = line:sub(col + 1, col + 1)

    if next_char == ")" or next_char == "]" or next_char == "}" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "i", false)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>e<Right>", true, true, true), "i", false)
    end
    -- How does it make it ergonomic? Well, even with a set of pre-configured
    -- snippets and auto-closing parens we still ought to manually
    -- "hop out" of the general inner scope. Due to the way neovim/vim
    -- treats a closing bracket (of any variety) we would either need
    -- to resort to temp Normal mode or to somehow "go back out" from the next line
    -- we're inevitably thrown into without any hope of landing at the intended position.

    -- In addition, adding brackets to 'iskeyword' only further exacerbates the issue in a number of
    -- unrelated ways thereby having us enter the incessant "whack-a-mole" recreative pastime territory
end, { desc = "Makes moving by word ergonomic in practice" })

set("n", "<C-x><C-s>", vim.cmd.update, { desc = "Save to same file" })
set("n", "<C-q><C-q>", ":qall!<CR>", { desc = "Exit all, ignore changes" })

-- Helix-aligned bindings
set("n", ">", ">>", {})
set("n", "<", "<<", {})
set({ "n", "x", "o" }, "l", "^", { desc = "" })
set({ "n", "x", "o" }, "L", "$", { desc = "" })
set({ "n", "x", "o" }, "ge", "Gzz", { desc = "Goto last line and center the view" })

-- Move split windows around
set("n", "<S-Left>", "<C-w>H", { desc = "Move Left" })
set("n", "<S-Right>", "<C-w>L", { desc = "Move Right" })
set("n", "<S-Down>", "<C-w>J", { desc = "Move Down" })
set("n", "<S-Up>", "<C-w>K", { desc = "Move Up" })

set({ "n", "v" }, "<C-k>", "4<C-y>", { desc = "<C-y> but four times" })
set({ "n", "v" }, "<C-.>", "4<C-e>", { desc = "four times <C-e>" })

set("n", "<C-j>", function()
    vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative line numbers" })

set("n", "<C-l>", function()
    local top = vim.fn.line("w0")
    local bottom = vim.fn.line("w$")
    local mid = math.floor((bottom + top) / 2)

    --@param line: number
    local set_current_line = function(line)
        local curr_col = vim.api.nvim_win_get_cursor(0)[2]
        vim.api.nvim_win_set_cursor(0, { line, curr_col })
    end

    local offset = vim.wo.scrolloff
    local curr_line = vim.fn.line(".")
    local new_line = (bottom <= offset and bottom)
        or (curr_line == bottom - offset and top + offset)
        or (curr_line >= mid and bottom - offset)
        or mid
    set_current_line(new_line)
end, { desc = "Emacs-like window cycling" })

set("n", "<A-l>", function()
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
        new_col,
    })
end, { desc = "Line cycling; inspired by Emacs window cycling" })

set("n", "<C-f>", function()
    if vim.fn.getcmdwintype() ~= "" then
        vim.cmd("close")
    else
        vim.api.nvim_feedkeys(":" .. vim.api.nvim_replace_termcodes("<C-f>", true, false, true), "n", false)
        vim.schedule(function()
            vim.cmd("resize 25")
        end)
    end
end, { desc = "Treat cmd line as a first-class citizen", noremap = true, silent = true })

set("n", "<leader>e", function()
    vim.diagnostic.open_float({
        border = "rounded",
        header = "",
        prefix = "",
    })
end, { desc = "On-demand diagnostic popup" })

set("n", "<leader>m", function()
    require("telescope.builtin").marks({
        layout_strategy = "center",
        layout_config = {
            width = 0.5,
            height = 0.4,
        },
    })
end, { desc = "A more detailed view of the currently set marks" })

set("n", "<leader>k", function()
    vim.api.nvim_set_hl(0, "HoverBoard", { fg = "#aaaaaa" })
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
end, { desc = "Hover with border" })

set("n", "<leader>d", function()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = not config.virtual_text and {
            prefix = " 󰃤",
        },
    })
end, { desc = "Toggle pollution of buffer with existing diag msgs" })

set("n", "<leader>zz", ":VimadeToggle<CR>", { desc = "[T]oggle [V]imade (window tint)" })

set("n", "kd", "<Plug>(nvim-surround-delete)", {
    desc = "Delete a surrounding pair",
})
set("n", "ks", "<Plug>(nvim-surround-change)", {
    desc = "Change a surrounding pair",
})
set("x", "k", "<Plug>(nvim-surround-visual)", {
    desc = "Add a surrounding pair around a visual selection",
})

set("i", "<C-l>", function()
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
end, { desc = "Same as ]<Space> but in Insert mode" })

set("i", "<A-l>", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "" })
end, { desc = "Same as [<Space> but in Insert mode" })

set("n", "<C-x><C-x>", "<C-x>", {})
set("n", "<C-i><C-i>", "<C-a>", {})

-- Rudimentary TSTree navigation
set("n", "<A-a>", function()
    if vim.fn.getcmdwintype() == ":" then
        vim.api.nvim_feedkeys("\r", "n", false)
        return
    end
    vim.api.nvim_feedkeys("van", "", false)
end, {})

set("v", "<A-a>", function()
    vim.api.nvim_feedkeys("an", "v", false)
end, {})

set("n", "<A-t>", function()
    vim.api.nvim_feedkeys("vin", "n", false)
end, {})

set("v", "<A-t>", function()
    vim.api.nvim_feedkeys("in", "v", false)
end, {})

set("n", "<A-n>", function()
    vim.api.nvim_feedkeys("v]n", "", false)
end, {})

set("v", "<A-n>", function()
    vim.api.nvim_feedkeys("]n", "v", false)
end, {})

set("n", "<A-p>", function()
    vim.api.nvim_feedkeys("v[n", "", false)
end, {})

set("v", "<A-p>", function()
    vim.api.nvim_feedkeys("[n", "v", false)
end, {})
