require('blink.cmp').setup({
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'hide' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-z>'] = { 'cancel', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
        menu = {
            -- disable autoshow (open via keymap to show)
            auto_show = false,
            draw = {
              -- enable menu colors based on treesitter
              -- treesitter = { 'lsp' } 

              -- enable menu colors based on colorful-menu plugin
              -- We don't need label_description now because label and label_description are already
              -- combined together in label by colorful-menu.nvim.
              columns = { { "kind_icon" }, { "label", gap = 1 } },
              components = {
                label = {
                  text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                  end,
                },
              },
            },
        },
        -- show ghost text
        ghost_text = {
          enabled = true,
          show_with_menu = false,
        },
    },
    sources = { default = { 'lsp', 'path', 'buffer', 'snippets' } },
    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
    },
    fuzzy = {
      -- define priority (based on suggestion from docs)
      sorts = {
        'exact',
        'score',
        'sort_text',
      },
      implementation = 'prefer_rust',
      prebuilt_binaries = { download = true },
    },
    signature = { 
        enabled = true 
    },
})

vim.lsp.config['*'] = {
    capabilities = require('blink.cmp').get_lsp_capabilities()
}
