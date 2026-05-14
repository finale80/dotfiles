# Useful links

* overall nvim 0.12 config with just a few plugins: https://www.youtube.com/watch?v=lljs_7xB7Ps&t=80s
* fzf-lua config: https://www.youtube.com/watch?v=R3e7uAE8jjo

# Extra tools and dependecies

* fzf: fetch from releases https://github.com/junegunn/fzf/releases
* ripgrep: fetch from releases: https://github.com/burntsushi/ripgrep/releases
* rustup: via apt-get from ubuntu 24.x
* rustc: once rustup is available, then run `rustup update stable`
* cargo binstall: https://github.com/cargo-bins/cargo-binstall
* tree-sitter cli: https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md + `sudo -E apt-get install libclang-dev`
* pyenv: manage python system installation https://github.com/pyenv/pyenv#linuxunix
* nvm: manage node system installation https://github.com/nvm-sh/nvm
* universal-ctags: required for tagbar and vista `sudo -E apt-get install universal-ctags`

# Issues

## cannot install rustup/rustc/cargo
These are required to install tree-sitter. However the installation strictly requires TLS/HTTPS and there is no easy way around corporate proxies. Specifically, some users found that enforcing that forcing RUSTUP_USE_CURL=1 (and configuring curl to bypass the proxy) help, but did not work in my case.

As last resort, if nothing work, grab a compiled binary from tree-sitter github release page. However, note that some servers might have a old version of glibc so you might need not the latest version. Specifically, on Ubuntu22 use v0.25.10

## cannot install nvm/node on WSL1
On WSL1 npm was issuing errors like `/home/finamore/.nvm/versions/node/v24.0.0/bin/node: 2: Syntax error: word unexpected (expecting ")")` and this was resolved based on a stackoverflow answer which requires creating a wrapper script for node/npm/npx (which apparently is adding extra libraries when invoking the commands) https://stackoverflow.com/questions/75767564/usr-bin-node-1-syntax-error-unexpected

## [vista.vim] ctags: Unknown option: --extras
possibly related to this issue https://github.com/microsoft/vscode-python/issues/3517
Resolved by compiling ctags as suggested by the README of the vista repo https://github.com/liuchengxu/vista.vim#other-tips

# Packages

## netrw
this is the vim built in file explorer
https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/

## nvim-tree
https://github.com/nvim-tree/nvim-tree.lua
Provides awesome file navigation. The default configuration recommend
to disable netrw, but I leave it enabled for now.

## oil
https://github.com/stevearc/oil.nvim
Edit files and folders from a buffer

## catppuccin
https://github.com/catppuccin/nvim
The catpuccin theme is now available as colorscheme in neovim
but the plugin has a few integration with other packages.
Specifically, we need the integration with lualine

## lualine
https://github.com/nvim-lualine/lualine.nvim
bottom status line

## fzflua
awesome integration of fzf
https://github.com/ibhagwan/fzf-lua

## tree-sitter
https://github.com/nvim-treesitter/nvim-treesitter

## lsp + mason
this configuration is more involved than the other
* mason is used to manually install lsp servers, linters and formatters (use `:Mason` to open the mason interface)
* efm is a generic language server that is configure to hook different lsp/linter/formatter depending for each language
* an autogroup is configured to attach the lsp

what to install via mason
```
    black
    clang-format
    cpplint
    eslint_d
    fixjson
    hadolint
    lua-language-server
    luacheck
    prettierd
    ruff
    shellcheck
    shfmt
    stylua
    ty
```

## autocompletion via blink.cmp + luasnip
https://github.com/saghen/blink.cmp

https://github.com/xzbdmw/colorful-menu.nvim
...and one extra plugin to colorize the autocompletion menu

## terminal 
https://github.com/akinsho/toggleterm.nvim
intergrate a shell terminal in a separate window

## ipython repl
https://github.com/pappasam/nvim-repl
integrate an ipython REPL in a separate window

## tab line
https://github.com/romgrk/barbar.nvim
show buffer as tabs

## mini
https://nvim-mini.org/mini.nvim/
It's a large collection of modules, so I'm still experimenting with them. So far the one enabled are
* mini.bracketed: jump to specific targets (e.g., comments, diagnostic)
* mini.map: visual buffer map
* mini.ai: extended text-objects
* mini.diff: visualize git changes

## gitsigns
https://github.com/lewis6991/gitsigns.nvim
visualize files changes

## tiny-inline-diagnostic
https://github.com/rachartier/tiny-inline-diagnostic.nvim
inline diagnostic

## nvim-autopairs
https://github.com/windwp/nvim-autopairs
automatically pair special chars (imo it's better than mini.pairs)

## tagbar
https://github.com/preservim/tagbar
show ctags

## indent blank line
https://github.com/lukas-reineke/indent-blankline.nvim
show vertical bars to guide indentation

## hlslens
https://github.com/kevinhwang91/nvim-hlslens
show counter for search and ease leap between search results

## scrollbar
https://github.com/petertriho/nvim-scrollbar
compact visual diagnostics



# Experimental

## vista
https://github.com/liuchengxu/vista.vim
alternative to tagbar (but seems to have issues with barbar and unclear if it can folds)


