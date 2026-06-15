local default_config = {
    select = {
        lookahead = false,
        lookbehind = false,
        selection_modes = {},
        include_surrounding_whitespace = false,
    },
    move = {
        set_jumps = true,
    },
}

local config = vim.deepcopy(default_config)

local M = {}

function M.update(cfg)
    config = vim.tbl_deep_extend("force", config, cfg)
end

setmetatable(M, {
    __index = function(_, k)
        return config[k]
    end,
})

return M
