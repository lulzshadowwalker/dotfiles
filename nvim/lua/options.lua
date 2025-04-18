require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.wrap = false
-- o.guicursor = ""
o.relativenumber = true

o.scrolloff = 8
o.sidescrolloff = 8

o.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
o.completeopt = "menuone,longest,preview"

o.title = true

o.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
o.completeopt = "menuone,longest,preview"

--  NOTE: Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 50 }
  end,
})

-- NOTE: For some reason auto/smart indentation is not working properly with php files with this option set
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "php" then
      return
    end

    vim.cmd "TSBufEnable highlight"
  end,
})

--  NOTE: Templ
vim.filetype.add { extension = { templ = "templ" } }
