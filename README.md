# 🚀 Lean Neovim (v0.11.x) Config

## Bootstrap
- `lazy-boostrap.lua` bootstraps lazy.nvim if not installed

## Keymaps
-  Heavily optimized for (slightly customized) Graphite layout 
    mapped to TOTEM split keyboard

## News
- `nvim-treesitter` is now on `main` branch; textobjects are not available
- `telescope` bumped to 0.2
- `nvim-cmp` vs `blink.cmp` (is all about) tradeoffs and balances
- `yazi.nvim` brings `yazi` to nvim through embedded terminal. Works ok
    for the most part with some peculiar edge cases. Overall, a nice
    alternative to both `Oil` and `mini.files`

## TODO
- Modular (i.e. maintainable configurations for C, Rust, Zig, Python, and Lua) LSP integration
- DAP

## Plugins to consider
- `stevearc/conform.nvim`
- `saghen/blink.cmp`
- `nvim-mini/mini-surround`

## Potenially add/rewrite config for
- `fidget.nvim`
- `mason.nvim`
- `mason-tool-installer`

## Future releases and associated points of interest (v0.12+)
- native plugin manager (`pack`)
