return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = { disabled_keys = {
        ['<Right>'] = { 'n', 'v' },
        ['<Left>'] = { 'n' , 'v' },
    } },
}
