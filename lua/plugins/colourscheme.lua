-- return{
-- 	priority = 1000,
-- 	config = function()
-- 		require('tokyonight').setup{
-- 			styles = {
-- 				comments = {italic = false},
-- 			},
-- 		}
-- 		vim.cmd.colorscheme 'tokyonight-night'
-- 	end,
-- }


-- return{
-- 	"lewis6991/github_dark.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme 'github_dark'
-- 	end,
-- }

return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		require('onedark').setup{
			style = 'darker'
		}
		require('onedark').load()
	end
}

-- return {
--     "EdenEast/nightfox.nvim",
--     config = function ()
--         vim.cmd("colorscheme nightfox")        
--     end
-- }

