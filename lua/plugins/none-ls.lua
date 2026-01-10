-- Attach flake8 diagnostics to Python files
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local flake8 = require("none-ls.diagnostics.flake8")

    null_ls.setup({
      sources = {
        flake8.with({
          command = vim.fn.stdpath("data") .. "/mason/bin/flake8",
        }),
      },
    })
  end,
}
