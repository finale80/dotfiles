vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/terrortylor/nvim-comment',
  'https://github.com/ibhagwan/fzf-lua',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
  },
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mattn/efm-langserver',
  'https://github.com/nvimdev/lspsaga.nvim',
  {
    src = 'https://github.com/saghen/blink.cmp',
    branch = 'v1',
    version = vim.version.range('1.*'),
  },
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/xzbdmw/colorful-menu.nvim',
  'https://github.com/akinsho/toggleterm.nvim',
  'https://github.com/pappasam/nvim-repl',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/romgrk/barbar.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/windwp/nvim-autopairs',
  -- 'https://github.com/liuchengxu/vista.vim',
  'https://github.com/preservim/tagbar',
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  'https://github.com/kevinhwang91/nvim-hlslens',
  'https://github.com/petertriho/nvim-scrollbar',
})

-- ad-hoc configs
require('plugins.setup.nvim-tree')
require('plugins.setup.catppuccin')
require('plugins.setup.lualine')
require('plugins.setup.nvim-treesitter')
require('plugins.setup.toggleterm')
require('plugins.setup.repl')
require('plugins.setup.barbar')
require('plugins.setup.oil')
require('plugins.setup.ibl')

-- defaults
require('nvim_comment').setup()
require('fzf-lua').setup()
require('mason').setup()
require('nvim-treesitter-textobjects').setup()
require("tiny-inline-diagnostic").setup()
require('nvim-autopairs').setup()
require('lspsaga').setup()
require('hlslens').setup()
require("scrollbar").setup()


-- blink.cmp (invoke before lsp config
require('plugins.setup.blink-cmp')

-- lsp
require('lsp.efm-langserver')
require('lsp.config')

-- mini
require('mini.bracketed').setup()
require('mini.map').setup()
require('mini.ai').setup()

-- experimental
require('plugins.setup.gitsigns')
require('mini.diff').setup()
