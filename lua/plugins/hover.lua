return {
    "lewis6991/hover.nvim",
    config = function ()
        local hover = require('hover')

        -- keybind to open hover window
        vim.keymap.set('n', '<leader>i', hover.open)

        hover.config({
            providers = {
                -- 'hover.providers.diagnostic',
                'hover.providers.lsp',
                'hover.providers.dap',
                'hover.providers.man',
                'hover.providers.dictionary',
                -- Optional, disabled by default:
                -- 'hover.providers.gh',
                -- 'hover.providers.gh_user',
                -- 'hover.providers.jira',
                'hover.providers.fold_preview',
                -- 'hover.providers.highlight',
            },
            preview_opts = {
                border = 'single'
            },
        })
        end
    }
