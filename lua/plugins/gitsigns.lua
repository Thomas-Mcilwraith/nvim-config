return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", desc = "[H]unk [S]tage" },
    { "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", desc = "[H]unk [R]eset" },
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
      signcolumn = true,           -- show signs
      numhl      = false,
      linehl     = false,
      word_diff  = false,
      watch_gitdir = { follow_files = true },
      auto_attach = true,          -- attach automatically to git buffers
      attach_to_untracked = true,  -- <--- show signs on untracked files too
      current_line_blame = false,
      sign_priority = 6,
      update_debounce = 100,
      max_file_length = 40000,
    }
  end,
}
