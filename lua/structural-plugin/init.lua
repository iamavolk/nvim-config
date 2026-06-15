local M = {}

function M.setup(options)
    if options then
        require("structural-plugin.config").update(options)
    end
end

return M
