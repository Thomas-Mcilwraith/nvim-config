require("utils")
require("core.keymaps")
require("core.set")
require("core.lazy")
require("core.floating_terminal")

-- clangd setup
require('lspconfig').clangd.setup {
    cmd = { "clangd",
        "--compile-commands-dir=breadboard-drone-flight-code" ,
        "--query-driver=**/arm-none-eabi-*"},
    root_dir = require('lspconfig.util').root_pattern('compile_commands.json', '.git'),
}

-- pyright corrected setup (resolves import issues in python)
require('lspconfig').pyright.setup({
  settings = {
    python = {
      analysis = {
        extraPaths = { "." },
      },
    },
  },
})
