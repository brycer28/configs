local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- use("neanias/everforest-nvim")
	-- use("sainnhe/gruvbox-material")
    use({
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                theme = "dragon",
                background = {
                    dark = "dragon",
                    light = "lotus",
                },
            })

            vim.o.termguicolors = true
            vim.cmd.colorscheme("kanagawa")
        end,
    })
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
	use("windwp/nvim-autopairs")
    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
    })
	use("stevearc/conform.nvim")
	use("goolord/alpha-nvim")
	use("christoomey/vim-tmux-navigator")
    use({
        "letieu/harpoon-lualine",
        opt=false,
        requires = {{"ThePrimeagen/harpoon"}}
    })
    use({
        "kdheepak/lazygit.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
    })
	if packer_bootstrap then
		require("packer").sync()
	end
end)
