-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
  tabufline = {
    order = { "treeOffset", "buffers", "tabs", "btns", "lulzie" },
    modules = {
      lulzie = function()
        return "lulzie "
      end,
    }
  },
}

return M

