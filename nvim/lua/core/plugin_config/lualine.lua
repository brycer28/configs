require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'kanagawa',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 3,
			}
		},
        lualine_b = {'branch'},
        lualine_c = {
            function()
                local harpoon = require("harpoon")
                local h_list = harpoon:list()
                local current = vim.fn.expand("%:p")

                for index, item in ipairs(h_list.items) do
                    if item.value == current then
                        return string.format("󰛢 %d/%d", index, #h_list.items)
                    end
                end
                return "󰛢"
            end,
        },
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'location'}
	}
})
