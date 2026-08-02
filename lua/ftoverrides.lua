--[[------------------
--   Filetype overrides
--]]
------------------
vim.filetype.add({
    -- by file extension
    extension = {
        xdc = "tcl",
        v = "systemverilog",
    },

    -- by file name
    filename = {
        ["Makefrag"] = "make",
    },
})
