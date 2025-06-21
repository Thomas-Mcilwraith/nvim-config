local utils = {}

function utils.lsp_map(keys,func,desc,mode)
	mode = mode or 'n'
	local event = 'VimEnter'
	vim.keymap.set(mode,keys,func, {buffer = event.buf, desc = 'LSP: ' .. desc })
end

return utils
