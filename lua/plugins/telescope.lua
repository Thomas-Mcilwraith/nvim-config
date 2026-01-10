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
        vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = "[F]iles"})
        vim.keymap.set('n', '<leader>sr', builtin.live_grep, {desc = "[R]epository"})
        vim.keymap.set('n', '<leader>sg', builtin.git_files, {desc = "[G]it Files"})
        vim.keymap.set('n', '<leader>sc', builtin.grep_string, {desc = "[C]urrent word"})

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
