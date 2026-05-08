-- configure and enable lsp servers
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostic = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    },
})
vim.lsp.config('ty', {})
vim.lsp.config('bashls', {})
vim.lsp.config('ts_ls', {})
vim.lsp.config('clangd', {})

vim.lsp.enable({
    'lua_ls',
    'ty',
    'bashls',
    'ts_ls',
    'clangd',
})
