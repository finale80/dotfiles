return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup({})

            -- python interpreter
            local python_path = vim.trim(vim.fn.system({ "which", "python" }))
            require("dap-python").setup(python_path)

            -- init virtual text
            require("nvim-dap-virtual-text").setup({
                --virt_text_pos = 'inline',
                virt_text_win_col = 80, 
                highlight_changed_variables = true
            })

            -- debugger keymap
            vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            vim.keymap.set('n', '<F1>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F2>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F3>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
            vim.keymap.set('n', '<leader>dx', function() require('dap').terminate() end)
            vim.keymap.set("n", "<leader>r", function()
                dap.run_to_cursor()
            end)
            -- vim.keymap.set({'n', 'v'}, '<leader>dh', function()
            --   require('dap.ui.widgets').hover()
            -- end)
            -- vim.keymap.set({'n', 'v'}, '<leader>dp', function()
            --   require('dap.ui.widgets').preview()
            -- end)
            vim.keymap.set('n', '<leader>df', function()
              local widgets = require('dap.ui.widgets')
              widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set('n', '<leader>ds', function()
              local widgets = require('dap.ui.widgets')
              widgets.centered_float(widgets.scopes)
            end)

            -- UI controls
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
