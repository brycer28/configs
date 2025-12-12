vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>", { desc = "Exit visual mode" })
vim.keymap.set("n", "<leader>th", ":15split | terminal<CR><C-w>J :resize 15<CR>i", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Open Explore" })

-- Keybinding for Surrounding text in Visual Mode
vim.api.nvim_set_keymap("v", "S", "<Plug>(nvim-surround-surround)", { noremap = true, silent = true })

-- toggle file tree
vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")

-- <leader>tt should jump focus to terminal window, if none exists create one
vim.keymap.set("n", "<leader>tt", function()
    vim.fn.jobstart({ vim.fn.expand("~") .. "/.tmux_toggle_nvim_term.sh" }, { detach = true })
end, { desc = "Toggle right tmux pane between wide/slim"})

-- <leader>pp should write a line to print the current paste bar (python syntax)
vim.keymap.set("n", "<leader>pp", function()
	local text = vim.fn.getreg("+")
	text = text:gsub("%z", "") -- remove null characters
	text = text:gsub("[\r\n]+$", "") -- remove trailing newlines
	vim.api.nvim_put({ "print(" .. text .. ")" }, "l", true, true)
end, { desc = "Paste clipboard inside print()" })

-- <leader>ps should write a line to print the current paste bar inside quotes (python syntax)
vim.keymap.set("n", "<leader>ps", function()
	local text = vim.fn.getreg("+")
	text = text:gsub("%z", "") -- remove null characters
	text = text:gsub("[\r\n]+$", "") -- remove trailing newlines
	vim.api.nvim_put({ "print('" .. text .. "')" }, "l", true, true)
end, { desc = "Paste clipboard inside print()" })

-- <leader>pf should write a line to print the current paste bar inside an f-string (python syntax)
vim.keymap.set("n", "<leader>pf", function()
	local text = vim.fn.getreg("+")
	text = text:gsub("%z", "") -- remove null characters
	text = text:gsub("[\r\n]+$", "") -- remove trailing newlines
	vim.api.nvim_put({ "print(f'{" .. text .. "}')" }, "l", true, true)
end, { desc = "Paste clipboard inside print()" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
-- Escape terminal mode using 'jk'
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode ?" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
local function smart_split_move(key)
    local ok = pcall(vim.cmd, "wincmd " .. key)
    if not ok then
        vim.fn.system({ "tmux", "select-pane", "-" .. key })
    end
end

vim.keymap.set("n", "<C-h>", function() smart_split_move("h") end, { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", function() smart_split_move("l") end, { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", function() smart_split_move("j") end, { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", function() smart_split_move("k") end, { desc = "Move focus to the upper window" })
