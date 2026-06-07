--[[--------------------
--    Global
--]]--------------------
vim.g.mapleader         = ' '
vim.g.maplocalleader    = ' '
vim.g.have_nerd_font    = true
vim.g.indentLine_bufTypeExclude = { 'terminal' }
vim.g.nvim_surround_no_mappings = true


--[[--------------------
--    Opt: {}
--]]--------------------
vim.opt.breakindent     = true
vim.opt.confirm         = true
vim.opt.clipboard       = 'unnamedplus'
vim.opt.completeopt     = { 'menuone' }
vim.opt.conceallevel    = 0
vim.opt.cursorline      = true
vim.opt.expandtab       = true -- all tabs replaced by spaces
vim.opt.foldcolumn      = '2' -- fixed, less mentally taxing
vim.opt.ignorecase      = true
vim.opt.inccommand      = 'nosplit' -- live feedback on substitution, etc. in cmd mode
vim.opt.list            = true  -- visible tabs, trailing chars, etc.
vim.opt.listchars       = { tab = '» ', trail = '·' } -- nbsp = '␣', eol = ''
vim.opt.mouse           = 'a'   -- default is "nvi", whereas "a" stands for "nvich" (command-line mode [c], and all previous when help file is edited [h])
vim.opt.number          = true
vim.opt.scrolloff       = 10
vim.opt.shiftwidth      = 4
--vim.opt.showmatch       = true -- momentarily jumps to a matching bracket upon insertion of one
vim.opt.signcolumn      = 'yes'
vim.opt.smartcase       = true -- overrides ignorecase is case of explicit capital letters
vim.opt.splitbelow      = true
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.undofile        = true
vim.opt.updatetime      = 1000
vim.opt.virtualedit     = 'block' -- allowed only in Visual Block mode
vim.opt.writebackup     = false
vim.opt.swapfile        = false
vim.opt.wrap            = false

vim.cmd.packadd('nohlsearch')
