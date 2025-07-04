return{
	{'nvim-tree/nvim-tree.lua',
		version = '*',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('nvim-tree').setup {
				sync_root_with_cwd = true,
				respect_buf_cwd = true, -- also good if you want buffer-local cwd syncing
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			}
		end,
	},
	{
		'nvim-tree/nvim-web-devicons',
		lazy = false,          
	}
}
