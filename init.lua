
require("core.lazy")
require("core.keymaps")
require("core.set")
require("core.autocommands")
require("core.diff_viewer") -- seperate file for managing non-git diffs

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'python',
        'fortran',
        'lua',
        'xml',
        'html'
    },
    callback = function() 
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr'
        -- vim.wo[0][0].foldmethod = 'expr'
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.treesitter.start() 
    end,
})
