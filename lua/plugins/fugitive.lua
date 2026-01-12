return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", function()
            vim.cmd.Git()
            vim.api.nvim_echo({{
                's:stage | u:unstage | =:toggle diff'
            }}, false, {})
        end, {desc = "[S]tatus"})
	end
}
