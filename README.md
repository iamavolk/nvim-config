# 🚀 Functional and ergonomic Neovim (0.11+) config

## Plugin/package manager
- Lazy (`lazy-boostrap.lua` bootstraps lazy.nvim if not installed)

## Integrated plugins
- [x] `gitsigns` (comprehensive integrated git functionality)
- [x] `inc-rename` (visual renaming with pseudo-multicursors)
- [x] `incr-nvim` (incremental selection of treesitter nodes)
- [x] `indent-blankline-nvim` (indentline guides)
- [x] `mini-statusline`(status line)
- [x] `nvim-cmp` (Lua-based completion engine)
- [x] `nvim-lspconfig` (community-maintained repo of LSP configs)
- [x] `nvim-treesitter` (glue-code plugin between treesitter and buffers)
- [x] `telescope` (comprehensive fuzzy-finder and picker/UI provider)
- [x] `ultimate-autopair` (QoL autopair provider)
- [x] `vimade` (QoL window/view UI provider)
- [x] `which-key` (hello emacs)
- [x] `yazi-nvim` (yazi inside nvim)
- [x] `nvim-treesitter-textobjects` (platform for crafting one's own way of structured code editing)
- [x] `marks` (brings vim's marks to the surface)
- [x] `nvim-surround` (surround and friends w/o vim-golf)
- [x] `blink.cmp` (Rust-based completion engine)
- [x] `fidget.nvim` (unobtrusive LSP notifications UI)


## TODO
- [ ] (WIP) Modular LSP organization
- [ ] DAP

## Keymaps
-  Heavily optimized for (a slightly customized) Graphite layout
    mapped to TOTEM split keyboard

## News
- `nvim-treesitter` is now on `main` branch  
    (dropped incremental selection and some other functionality)
- `telescope` is on v0.2

## Plugins to consider
- `stevearc/conform.nvim`
- `fidget.nvim`

## Lower priority
- `mason.nvim`
- `mason-tool-installer` (might be useful for DAP)

## Future releases and associated points of interest (v0.12+)
- native plugin manager (`pack`)
