return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>ga", "<cmd>Gitsigns stage_hunk<CR>", desc = "[A]dd hunk" },
        { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "[Reset] hunk" },
        { "<leader>gA", "<cmd>Gitsigns stage_buffer<CR>", desc = "[A]dd buffer" },
        { "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "[Reset] buffer" },
        { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle [B]lame" },
    },
    config = function ()
        require('gitsigns').setup {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn = true,           -- show signs
            numhl      = false,
            linehl     = false,
            word_diff  = false,
            watch_gitdir = { follow_files = true },
            auto_attach = true,          -- attach automatically to git buffers
            attach_to_untracked = true,  -- <--- show signs on untracked files too
            current_line_blame = true,
            sign_priority = 6,
            update_debounce = 100,
            max_file_length = 40000,
        }

        require("scrollbar.handlers.gitsigns").setup()
    end,
}
