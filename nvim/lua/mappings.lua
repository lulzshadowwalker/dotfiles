require "nvchad.mappings"

local map = vim.keymap.set

-- love it.
map("n", "<Leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" })
map("n", "<Leader>tf", ":TestFile<CR>", { desc = "Test File" })
map("n", "<Leader>ts", ":TestSuite<CR>", { desc = "Test Suite" })
map("n", "<Leader>tl", ":TestLast<CR>", { desc = "Test Last" })
map("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Test Visit" })

map("n", "ds", function()
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "LSP Document symbols" })

-- Reselect visual selection after indenting.
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>k", ":nohl<CR>", { desc = "Clear highlights" })

map("n", "<leader>o", ":only<CR>", { desc = "Hide all other windows" })

map("n", "<leader>co", "<cmd>:%bd|e#|bd#<CR>", { desc = "Close all open buffers except current one" })
map("n", "<leader>ca", "<cmd>bufdo bd<CR>", { desc = "Close all open buffers" })
map("n", "<leader>==", "mmggVG=`m", { desc = "Auto indent the whole file" })

function toggle_terminal()
  require("nvchad.term").toggle { pos = "sp", id = "lulzie-horizontal-terminal" }
end

function toggle_floating_terminal()
  require("nvchad.term").toggle { pos = "float", id = "lulzie-floating-terminal" }
end

map({ "n", "t" }, "<M-o>", toggle_floating_terminal, { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<M-j>", toggle_terminal, { desc = "Toggle terminal" })

map("n", "<leader>ng", ":Neogit<cr>", { desc = "Neogit open" })

map("n", "<C-t>", function() require("nvchad.themes").open() end, { desc = "Nvchad open theme switcher" })
map("n", "<C-w>", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help" }) --  NOTE: Also available as <leader>sh

map("i", ",,", "<esc>ml$a,<esc>`l", { desc = "Insert a comma at the end of the line" })
map("i", ";;", "<esc>ml$a;<esc>`l", { desc = "Insert a comma at the end of the line" })

map("n", "<leader>qo", ":copen<cr>", { desc = "Quickfix open" })
map("n", "<leader>qc", ":cclose<cr>", { desc = "Quickfix close" })
map("n", "<leader>qn", ":cn<cr>", { desc = "Quickfix next" })
map("n", "<leader>qp", ":cp<cr>", { desc = "Quickfix previous" })

-- Emacs-like keybindings for command mode
map("c", "<M-b>", "<S-Left>", { noremap = true, desc = "Move one word left" })
map("c", "<M-f>", "<S-Right>", { noremap = true, desc = "Move one word right" })
--
map("c", "<C-a>", "<Home>", { noremap = true, desc = "Move to start of line" })
map("c", "<C-e>", "<End>", { noremap = true, desc = "Move to end of line" })
--
map("c", "<C-b>", "<Left>", { noremap = true, desc = "Move one character left" })
map("c", "<C-f>", "<Right>", { noremap = true, desc = "Move one character right" })
--
map("c", "<M-Backspace>", "<C-W>", { noremap = true, desc = "Delete previous word" })
--
map("c", "<C-p>", "<Up>", { noremap = true, desc = "Previous command in history" })
map("c", "<C-n>", "<Down>", { noremap = true, desc = "Next command in history" })
--
map("c", "<C-g>", "<C-c>", { noremap = true, desc = "Cancel command line" })