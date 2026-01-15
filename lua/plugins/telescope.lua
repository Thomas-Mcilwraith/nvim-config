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
        vim.keymap.set('n', '<leader>sr', builtin.git_files, {desc = "[R]epository"})
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc = "[G]rep"})
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {desc = "[D]iagnostics"})
        vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, {desc = "[B]uffer"})
        vim.keymap.set('n', '<leader>sC', builtin.grep_string, {desc = "[C]urrent word (all)"})

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
