require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.wrap = false
o.guicursor=''
o.relativenumber = true

o.scrolloff = 8
o.sidescrolloff = 8

o.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
o.completeopt = 'menuone,longest,preview'

o.title = true

o.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
o.completeopt = 'menuone,longest,preview'

o.title = true
