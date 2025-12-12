require('lazygit')

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })
