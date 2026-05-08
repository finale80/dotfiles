return {
    "preservim/tagbar",
    config = function()
        vim.keymap.set('n', 'T', ':TagbarToggle<CR>')
    end
}
