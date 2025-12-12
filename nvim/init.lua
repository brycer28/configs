local orig_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin)
    if type(name) == "string"
        and name:match("lspconfig")
        and alternative == nil
    then
        return
    end

    return orig_deprecate(name, alternative, version, plugin)
end

vim.g.mapleader = " "

require("core.plugins")
require("core.keymaps")
require("core.options")
require("core.lspconfig")
require("core.cmp")
require("core.autocmd")
require("core.plugin_config")
