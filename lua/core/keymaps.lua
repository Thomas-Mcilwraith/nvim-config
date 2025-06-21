-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ===== GENERAL KEYBINDINGS ===================================================
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>') -- Disable arrow keys in normal mode
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- ===== FILE EXPLORER =========================================================
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File [E]xplorer' })

-- ===== GIT INTEGRATION =======================================================
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", { desc = '[L]azygit', noremap = true, silent = true})
vim.keymap.set('n', '<leader>gr', function ()
    require('gitsigns').reset_hunk()
end, { desc = '[R]eset Hunk'})
vim.keymap.set("n", "<leader>gb", ":e!<CR>", { desc = "Refresh [G]it [B]uffer" })

-- ===== TERMINAL ==============================================================
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>tn', ':terminal<CR>i', { desc = '[T]erminal: [N]ew' })
vim.keymap.set('n', '<leader>ts', ':10split | terminal<CR>i', { desc = '[T]erminal: [S]mall' })

-- ===== BUFFERS ===============================================================
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>bd', ':bdelete!<CR>', { desc = '[B]uffer: [D]elete' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer: [N]ext' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = '[B]uffer: [P]revious' })
vim.keymap.set('n', '<leader>ba', function()
    vim.cmd 'silent! %bd'
end, { desc = '[B]uffer: Delete [A]ll' })


local keymaps = {}

-- ===== TELESCOPE =============================================================
function keymaps.telescope()
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
        }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim config files' })
end

return keymaps
