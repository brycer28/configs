local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    }
})

vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "[H]arpoon [A]dd file" })

vim.keymap.set("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon [H]arpoon menu" })

for i = 1, 4 do
    vim.keymap.set("n", string.format("<leader>%d", i), function()
        harpoon:list():select(i)
    end, { desc = "Harpoon to file " .. i })
end
