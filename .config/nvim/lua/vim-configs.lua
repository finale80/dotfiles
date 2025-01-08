vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- format based on lsp
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)
-- -- Copy from visual mode to clipboard
vim.keymap.set('v', '<leader>y', '"+y')


-- options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.incsearch = true -- incremental highlight when search
vim.opt.hlsearch = true
vim.opt.list = true -- show tab characters and training spaces

vim.cmd("set number")
--vim.cmd("autocmd InsertEnter * :set relativenumber")
--vim.cmd("autocmd InsertLeave * :set norelativenumber")
vim.opt.relativenumber = true
vim.opt.autowrite = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minum number of columns to keep left and right the cursor

-- python formatting
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = "*.py",
    callback = function()
        vim.opt.textwidth = 79
        vim.opt.colorcolumn = "79"
    end
})
