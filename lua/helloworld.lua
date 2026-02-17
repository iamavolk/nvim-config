local file = io.open("nicefile.txt", "w")
-- file:write(vim.inspect(vim.api.nvim_buf_add_highlight))
file:write(vim.inspect(vim))
file:close()
