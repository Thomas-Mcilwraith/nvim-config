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
    })

  end,
}
