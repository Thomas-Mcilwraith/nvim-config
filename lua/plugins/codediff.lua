return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },

  cmd = "CodeDiff",

  keys = {
    {
      "<leader>gd",
      "<cmd>CodeDiff<CR>",
      desc = "[D]iff viewer",
    },
  },

  config = function()
    require("codediff").setup({
      diff = {
        original_position = "left",
        conflict_ours_position = "right",
      },
      conflict = {
          accept_incoming = "<leader>ct",  -- Accept incoming (theirs/left) change
          accept_current = "<leader>co",   -- Accept current (ours/right) change
          accept_both = "<leader>cb",      -- Accept both changes (incoming first)
          discard = "<leader>cx",          -- Discard both, keep base
          next_conflict = "]x",            -- Jump to next conflict
          prev_conflict = "[x",            -- Jump to previous conflict
      }
    })

  end,
}
