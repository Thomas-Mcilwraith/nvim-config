vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "netrw" then
        vim.cmd("bd")      -- close netrw buffer
    else
        vim.cmd("Ex")      -- open netrw
    end
end, { desc = "Toggle netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

vim.keymap.set('n', '<leader>t', toggle_terminal_tab, {
    noremap = true,
    silent = true,
    desc = "Toggle terminal tab",
})

-- manage windows
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

vim.keymap.set("n", "<leader>W", function()
    if #vim.api.nvim_list_wins() > 1 then
        vim.cmd("close")
    else
        vim.cmd("q")
    end
end, { silent = true })

local function close_tab_buffers(tabnr, save)
    -- Get windows in the tab
    local wins = vim.api.nvim_tabpage_list_wins(tabnr)
    local buffers = {}

    -- Collect unique buffers
    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        buffers[buf] = true
    end

    for buf, _ in pairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) then
            if save and vim.bo[buf].modified then
                vim.api.nvim_buf_call(buf, function()
                    vim.cmd("silent! write")
                end)
            end
            vim.cmd("bdelete! " .. buf)
        end
    end
end

vim.keymap.set("n", "<leader>q", function()
    local tabs = vim.api.nvim_list_tabpages()

    -- Tab 1: save + force close
    if tabs[1] then
        close_tab_buffers(tabs[1], true)
    end

    -- Tab 2: force close, no save
    if tabs[2] then
        close_tab_buffers(tabs[2], false)

        -- Finally, exit Neovim
        vim.cmd("qa!") end
    end, { desc = "Tab1 save+close | Tab2 force close" })
