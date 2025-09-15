-- line no
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.scrolloff = 15
vim.o.colorcolumn = "100"

-- clipboard
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- undo history
vim.o.undofile = true

-- searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- visual/style effects
vim.g.have_nerd_font = true
vim.o.showmode = false
vim.o.breakindent = true
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4 -- Number of spaces per indentation level
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'

-- windows
vim.o.splitright = true
vim.o.splitbelow = true

-- system
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
  pattern = "*",
})
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true

-- -- mouse
-- vim.mouse = 'a'
