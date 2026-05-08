require("catppuccin").setup({
    integrations = {
        lualine = {
            -- lualine color overrides in the following hierarchy: Catppuccin Flavor -> Mode -> Lualine Section
            -- The Catppuccin flavor entry can be any Catpuccin flavor or "all" to apply to all flavors
            -- The flavor entry can be either a table or a function which consumes the current Catppuccin palette, just like custom_highlights and color_overrides
            all = function(colors)
                ---@type CtpIntegrationLualineOverride
                return {
                    -- Specifying a normal-mode status line override for section a's background and b's foreground to use lavender like the main Catppuccin theme
                    normal = {
                        a = { bg = colors.lavender },
                        b = { fg = colors.lavender },
                    }
                }
            end,
            -- A macchiato-specific override, which takes priority over 'all'. Also using the direct table syntax instead of function in case you do not rely on dynamic palette colors
--            macchiato = {
--                normal = {
--                    a = { bg = "#abcdef" },
--                }
--            },
        },
    }
})

