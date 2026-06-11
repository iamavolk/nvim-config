return {
  {
    "thesimonho/kanagawa-paper.nvim",
    -- lazy = false,
    priority = 1000,
    init = function ()
        vim.cmd.colorscheme("kanagawa-paper-ink")
    end,
    config = function ()
        require("kanagawa-paper").setup({
            dim_inactive = true,
            cache = true,
        })
    end,
    -- opts = {
    --     dim_inactive = true,
    -- },
  }
}
