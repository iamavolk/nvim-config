--[[--------------------
--    Global
--]]--------------------
vim.g.mapleader         = ' '
vim.g.maplocalleader    = ' '
vim.g.have_nerd_font    = true
vim.g.indentLine_bufTypeExclude = { 'terminal' }


--[[--------------------
--    Opt: {}
--]]--------------------
vim.opt.breakindent     = true
vim.opt.confirm         = true
vim.opt.clipboard       = 'unnamedplus'
vim.opt.completeopt     = 'menuone,noselect'
vim.opt.conceallevel    = 0
vim.opt.cursorline      = true
vim.opt.expandtab       = true -- all tabs replaced by spaces
vim.opt.foldcolumn      = '2'
vim.opt.ignorecase      = true
vim.opt.inccommand      = 'split'
vim.opt.list            = true  -- visible tabs, trailing chars, etc.
vim.opt.listchars       = { tab = '» ', trail = '·' }
--vim.opt.listchars       = { tab = '» ', trail = '·', nbsp = '␣', eol = '' }
vim.opt.mouse           = 'a'   -- neovim default is "nvi", whereas "a" stands for "nvich" (command-line mode + all previous when help file is edited)
vim.opt.number          = true  -- with the 'relativenumber' enabled, shows the global line number under cursor
-- vim.opt.relativenumber  = true
vim.opt.scrolloff       = 10
vim.opt.shiftwidth      = 4
--vim.opt.showmatch       = true
vim.opt.signcolumn      = 'yes'
vim.opt.smartcase       = true
vim.opt.splitbelow      = true
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.undofile        = true
vim.opt.updatetime      = 1000
vim.opt.virtualedit     = 'block'
vim.opt.writebackup     = false
vim.opt.swapfile        = false
vim.opt.wrap            = false

vim.cmd.packadd('nohlsearch')
