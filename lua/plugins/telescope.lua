return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-tree/nvim-web-devicons', opts = {} },
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function ()
        local builtin = require('telescope.builtin')

        -- set keymaps
        vim.keymap.set('n', '<leader>sf', builtin.find_files)   
        vim.keymap.set('n', '<leader>sr', builtin.live_grep)   
        vim.keymap.set('n', '<leader>sc', builtin.grep_string)

        -- setup telescope
        require('telescope').setup({

            defaults = {
                -- disable ripgrep dep
                vimgrep_arguments = {
                    "grep",
                    "--color=never",
                    "--with-filename",
                    "--line-number",
                    "-b",
                    "--ignore-case",
                    "--recursive",
                    "--no-messages",
                },
            }
        })
    end
}
