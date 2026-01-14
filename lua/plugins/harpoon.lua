return{
    "ThePrimeagen/harpoon",
    dependancies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        vim.keymap.set('n', '<leader>h', require("harpoon.ui").toggle_quick_menu, {desc = '[H]arpoon'})
        vim.keymap.set('n', '<leader>a', require("harpoon.mark").add_file, {desc = '[A]dd to Harpoon'})
        vim.keymap.set('n', '<leader>{', function() require("harpoon.ui").nav_file(1) end, {desc = '[H]1'})
        vim.keymap.set('n', '<leader>[', function() require("harpoon.ui").nav_file(2) end, {desc = '[H]2'})
        vim.keymap.set('n', '<leader>(', function() require("harpoon.ui").nav_file(3) end, {desc = '[H]3'})
    end

}
