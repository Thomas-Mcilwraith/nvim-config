-- Attach linters (flake8, etc) to relevant files
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
          command = vim.fn.expand("$HOME/.local/bin/flake8"),
        }),
      },
    })

    vim.lsp.enable("null-ls")
  end,
}
