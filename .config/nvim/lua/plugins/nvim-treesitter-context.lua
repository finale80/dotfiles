return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require("treesitter-context").setup({
            multiwindow=true;
            max_lines = 5,
            separator="-";
            mode="cursor";
        })
    end,
}
