vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
	view = {
		width = 40,
		side = "left",
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
            window_picker = {
                enable = false,
            }
		},
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
		end

		vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open file"))
		vim.keymap.set("n", "r", api.tree.change_root_to_node, opts("Change root to node"))
		vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
	end,
})

vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")
