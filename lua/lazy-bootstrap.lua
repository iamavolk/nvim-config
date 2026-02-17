local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

vim.opt.rtp:prepend(lazypath)

local scheme = 'kanagawa-paper-ink'

require('lazy').setup({
        require 'plugins.colorschemes.kanagawa-paper',
        require 'plugins.mini-statusline',
        require 'plugins.nvim-treesitter',
        require 'plugins.yazi-nvim',
        require 'plugins.ultimate-autopair',
        require 'plugins.indentline',
        require 'plugins.gitsigns',
        require 'plugins.which-key',
        require 'plugins.telescope',
        -- require 'plugins.lsp-new',
        require 'plugins.nvim-cmp',
    },

    { install = { colorscheme = { scheme } } }
)

vim.cmd.colorscheme(scheme)
-- vim: ts=4 sts=4 sw=4 et
