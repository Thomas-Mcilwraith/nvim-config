vim.g.mapleader = " "

-- netrw toggle
vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "netrw" then
        vim.cmd("bd")      -- close netrw buffer
    else
        vim.cmd("Ex")      -- open netrw
    end
end, { desc = "Toggle netrw" })

-- move paragraphs up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep buffer centered on scroll
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- better terminal exit
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- manage tabs
local function toggle_terminal_tab()
    local current_tab = vim.fn.tabpagenr()
    local total_tabs = vim.fn.tabpagenr('$')

    -- If currently in terminal tab (tab 2), go back to code tab (tab 1)
    if current_tab == 2 then
        vim.cmd('tabnext 1')
        return
    end

    -- Otherwise, go to or create terminal tab
    if total_tabs >= 2 then
        vim.cmd('tabnext 2')
    else
        vim.cmd('tabnew')
        vim.cmd('terminal')
        vim.cmd('only')
    end
end
-- create second tab on vim enter, go back to first tab
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    toggle_terminal_tab()
    toggle_terminal_tab()
  end,
})

-- toggle between terminal tab and code tab
vim.keymap.set('n', '<leader>t', toggle_terminal_tab, {
    noremap = true,
    silent = true,
    desc = "Toggle terminal tab",
})

-- open window to the right
vim.keymap.set('n', '<leader>w', function()
    local current_tab = vim.fn.tabpagenr()

    if current_tab == 1 then
        vim.cmd('vsplit')
        vim.cmd('wincmd l')
    elseif current_tab == 2 then
        vim.cmd('vsplit')
        vim.cmd('wincmd l')
        vim.cmd('terminal')
    end
end, {silent = true})

-- close window
vim.keymap.set("n", "<leader>W", function()
    if #vim.api.nvim_list_wins() > 1 then
        vim.cmd("close")
    else
        vim.cmd("q")
    end
end, { silent = true })

-- quit
function confirm_quit_nvim()
  local choice = vim.fn.confirm(
    "Quit Neovim? Unsaved changes will be lost.",
    "&Yes\n&No",
    2
  )

  if choice == 1 then
    vim.cmd("qa!")
  end
end
vim.keymap.set("n", "<leader>q", confirm_quit_nvim, {
  noremap = true,
  silent = true,
  desc = "Confirm quit Neovim",
})

-- copy to tabby clipboard
vim.keymap.set('v', '<leader>c', function()
    require('osc52').copy_visual()
end, {desc = "[C]opy to host}"})

-- Leader+v to paste from terminal (tabby clipboard)
vim.keymap.set('n', '<leader>v', function()
    vim.opt.paste = true
    print("Press Shift+Insert (or Ctrl+Shift+V) to paste from host clipboard")
    vim.cmd([[autocmd CursorMoved,InsertEnter * set nopaste | augroup END]])
end, {desc = "[V]aste from host"})

