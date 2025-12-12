local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "pyright",
    "lua_ls",
    "gopls",
    "clangd",
    "html",
    "cssls",
    "vtsls",
}

mason_lspconfig.setup({
    ensure_installed = servers,
})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

local server_settings = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
    },

    pyright = {
        settings = {
            pyright = {
                analysis = {
                    typeCheckingMode = "off",
                    autoSearchPaths = true,
                    autoImportCompletions = true,
                    useLibraryCodeForTypes = true,
                },
            },
        },
    },

    gopls = {
        settings = {
            gopls = {
                analyses = { unusedparams = true, shadow = true },
                staticcheck = true,
            },
        },
    },

    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcp" },
        root_dir = lspconfig.util.root_pattern(
            "compile_commands.json",
            "compile_flags.txt",
            ".git"
        ),
    },
    
    html = {
        capabilities = capabilities,
    },

    cssls = {
        capabilities = capabilities,
        settings = {
            css = { validate = true },
            less = { validate = true },
            scss = { validate = true },
        },
    },

    vtsls = {
        capabilities = capabilities,
    },

    vue_ls = {
        filetypes = { "vue" },
        init_options = {
            vue = {
                hybridMode = false,
            },
        },
        settings = {
            vue = {
                updateImportsOnFileMove = {
                    enabled = true,
                },
                javascript = {
                    suggestions = true,
                    inlayHints = true,
                },
                typescript = {
                    suggestions = true,
                    inlayHints = true,
                },
            },
        },
    }
}

for _, server in ipairs(servers) do
    local opts = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
    }, server_settings[server] or {})

    lspconfig[server].setup(opts)
end
