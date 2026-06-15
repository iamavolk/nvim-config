return {
    dir = "~/proj/lua/myplugin",
    dev = true,
    config = function()
        require("myplugin").setup({})
    end,
}
