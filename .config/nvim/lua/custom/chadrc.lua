-- Just an example, supposed to be placed in /lua/custom/
local function rcall(name)
    local ok, r = pcall(require, name)
    if ok then
        return r
    else
        vim.notify("Can not loaded \"" .. name .. "\"!")
        return {}
    end
end

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
    user = function ()
        rcall("custom.options")
    end,
}

M.ui = {
   theme = "onedark",
}

-- so setup_lspconf = any file but that should be in custom dir!
M.plugins = {
   user = {
       ["goolord/alpha-nvim"] = rcall("custom.plugins.alpha"),
       ["ray-x/go.nvim"] = rcall("custom.plugins.gonvim"),
       ["ray-x/guihua.lua"] = {},
       ["LhKipp/nvim-nu"] = rcall("custom.plugins.nvim_nu"),
   },
   override = {
      ["nvim-treesitter/nvim-treesitter"] = rcall("custom.plugins.treesitter"),
      ["folke/which-key.nvim"] = rcall("custom.plugins.whichkey"),
      ["goolord/alpha-nvim"] = rcall("custom.plugins.alpha"),
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.mappings = rcall("custom.mappings")

return M
