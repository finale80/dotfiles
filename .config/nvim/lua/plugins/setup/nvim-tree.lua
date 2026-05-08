local function nvimtree_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { 
            desc = "nvim-tree: " .. desc, 
            buffer = bufnr, 
            noremap = true, 
            silent = true, 
            nowait = true 
        }
    end

    -- default mappings
    api.map.on_attach.default(bufnr)

    -- custom mappings
    -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end


require("nvim-tree").setup({
  -- keep netrw (vim default file explorer)
  -- vim.g.loaded_netrw = 1
  -- vim.g.loaded_netrwPlugin = 1

  -- empty setup using defaults
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, -- show hidden files
  },
  view = {
    adaptive_size = true,
  },
  on_attach = nvimtree_on_attach,
})
