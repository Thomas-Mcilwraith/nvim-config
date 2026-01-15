return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
            })
        end
    }
}
