# 🚀 Functional and ergonomic Neovim (0.11+) config

## Plugin/package manager
- Lazy (`lazy-boostrap.lua` bootstraps lazy.nvim if not installed)

## Integrated plugins
- [x] [gitsigns](https://github.com/lewis6991/gitsigns.nvim) (comprehensive integrated git functionality)
- [x] [inc-rename](https://github.com/smjonas/inc-rename.nvim) (visual renaming with pseudo-multicursors)
- [x] [incr-nvim](https://github.com/daliusd/incr.nvim) (incremental selection of treesitter nodes)
- [x] [indent-blankline-nvim](https://github.com/lukas-reineke/indent-blankline.nvim) (indentline guides)
- [x] [mini-statusline](https://github.com/nvim-mini/mini.statusline) (status line)
- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (Lua-based completion engine)
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (community-maintained repo of LSP configs)
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (glue-code plugin between treesitter and buffers)
- [x] [telescope](https://github.com/nvim-telescope/telescope.nvim) (comprehensive fuzzy-finder and picker/UI provider)
- [x] [ultimate-autopair](https://github.com/altermo/ultimate-autopair.nvim) (QoL autopair provider)
- [x] [vimade](https://github.com/TaDaa/vimade) (QoL window/view UI provider)
- [x] [which-key](https://github.com/folke/which-key.nvim) (hello emacs)
- [x] [yazi-nvim](https://github.com/mikavilpas/yazi.nvim) ([yazi](https://github.com/sxyazi/yazi) inside nvim)
- [x] [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) (platform for crafting one's own way of structured code editing)
- [x] [marks](https://github.com/chentoast/marks.nvim) (brings vim's marks to the surface)
- [x] [nvim-surround](https://github.com/kylechui/nvim-surround) (surround and friends w/o vim-golf)
- [x] [blink.cmp](https://github.com/Saghen/blink.cmp) (completion engine with Rust-based fuzzy matcher)
- [x] [fidget.nvim](https://github.com/j-hui/fidget.nvim) (unobtrusive LSP notifications UI)


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

## Lower priority
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) (might be useful for DAP)

## Future releases and associated points of interest (v0.12+)
- native plugin manager (`pack`)
