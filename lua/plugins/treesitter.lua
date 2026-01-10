return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	-- event = {"BufReadPost", "BufNewFile"},
	main = 'nvim-treesitter.configs',
	config = function()

		require('nvim-treesitter.config').setup({
			ensure_installed = {
				"vimdoc", "lua", "c", "bash", "fortran", "python"
			},
			sync_install = true,
			indent = { enable = true },
			highlight = {
				enable = true,

				additional_vim_regex_highlighting = { "markdown" },
			}
		})

	end
}
