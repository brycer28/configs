require("nvim-treesitter.configs").setup({
    modules = {},
    ignore_install = {},

	ensure_installed = {
        -- languages
        "lua", "python", "cpp", "bash", "go", "rust", "java", "ruby", "sql",

        -- systems and scripting
        "dockerfile", "gitignore", "make", "vim", "vimdoc",

        -- markdown
        "json", "yaml", "xml", "csv",

        -- config
        "toml", "ini"
    },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
    indent = {
        enable = true,
    },
})
