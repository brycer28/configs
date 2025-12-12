require("telescope").setup{
    pickers = {
        find_files = {
            find_comand = {
                "rg", "--files", "--ignore-case"
            },
        },
    }
}

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set('n', '<leader>cc', builtin.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = "Go to Definition" })
vim.keymap.set('n', '<leader>kk', builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = "Treesitter" })
