return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = {"BufReadPost", "BufNewFile"},
	main = 'nvim-treesitter.configs',
	config = function()

		require('nvim-treesitter.config').setup({
            install_dir = vim.fn.stdpath('data') .. '/site',
			ensure_installed = {
				"vimdoc", "lua", "c", "bash", "fortran", "python"
			},
			indent = { enable = true },
			highlight = {
				enable = true,

				additional_vim_regex_highlighting = { "markdown" },
			}
		})
    end
}
