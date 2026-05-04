# 🚀 Functional and ergonomic Neovim (stable, 0.12) config

## Plugin/package manager
- Lazy (`lazy-boostrap.lua` bootstraps lazy.nvim if not installed)

## Integrated plugins
- [x] [blink.cmp](https://github.com/Saghen/blink.cmp) (completion engine with fuzzy matcher written in Rust)
- [x] [codediff.nvim](https://github.com/esmuellert/codediff.nvim) (great project, matches VS Code git diff nearly perfectly)
- [x] [fidget.nvim](https://github.com/j-hui/fidget.nvim) (unobtrusive LSP notifications UI)
- [x] [gitsigns](https://github.com/lewis6991/gitsigns.nvim) (comprehensive integrated git functionality)
- [x] [inc-rename](https://github.com/smjonas/inc-rename.nvim) (visual renaming with pseudo-multicursors)
- [x] [incr-nvim](https://github.com/daliusd/incr.nvim) (incremental selection of treesitter nodes)
- [x] [indent-blankline-nvim](https://github.com/lukas-reineke/indent-blankline.nvim) (indentline guides)
- [x] [marks](https://github.com/chentoast/marks.nvim) (vim marks redefined, very useful, much more ergonomic than breadcrumbs)
- [x] [mini-statusline](https://github.com/nvim-mini/mini.statusline) (status line)
- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (completion engine)
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (community-maintained repo of LSP configs)
- [x] [nvim-surround](https://github.com/kylechui/nvim-surround) (surround and friends w/o vim-golf)
- [x] [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) (platform for crafting one's own way of structured code editing)
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (glue-code plugin between treesitter and buffers)
- [x] [telescope](https://github.com/nvim-telescope/telescope.nvim) (comprehensive fuzzy-finder and picker/UI provider)
- [x] [ultimate-autopair](https://github.com/altermo/ultimate-autopair.nvim) (QoL autopair provider)
- [x] [vimade](https://github.com/TaDaa/vimade) (QoL window/view UI provider)
- [x] [which-key](https://github.com/folke/which-key.nvim) (hello emacs)
- [x] [yazi-nvim](https://github.com/mikavilpas/yazi.nvim) ([yazi](https://github.com/sxyazi/yazi) inside nvim)


## TODO
- [ ] (WIP) Modular LSP organization
- [ ] DAP

## Keymaps
-  Heavily optimized for (a slightly customized) [Graphite](https://github.com/rdavison/graphite-layout) layout
    mapped to [TOTEM](https://github.com/GEIGEIGEIST/TOTEM) split keyboard

## News
- `nvim-treesitter` is now on `main` branch  
    (dropped incremental selection and some other functionality)
- `telescope` is on v0.2

## Plugins to consider
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [possession](https://github.com/gennaro-tedesco/nvim-possession)
- [auto-session](https://github.com/rmagatti/auto-session)

## Lower priority
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) (might be useful for DAP)

## Future releases and associated points of interest (v0.12+)
- native plugin manager (`pack`)
