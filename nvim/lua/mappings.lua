require "nvchad.mappings"

local map = vim.keymap.set

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

function Close_others()
  local current = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(bufs) do
    if current ~= buf and vim.api.nvim_buf_is_loaded(buf) then
      --  NOTE: `pcall` because it errors out when trying to close terminal buffers
      local err = pcall(vim.cmd, "bd" .. buf)
      if err then
        print("Error closing buffer")
      end
    end
  end
end

map("n", "<leader>qq", "<cmd>bufdo bd<CR>", { desc = "Close all open buffers" })

--  NOTE: Currently, we have another mapping that uses <leader>qo for quickfix open + this one seems to be a little buggy at times 
--  iirc, when e.g. trying to close other buffer and you have zsh or terminal open
-- map("n", "<leader>qo", Close_others, { desc = "Close all open buffers except current one" })

map("n", "<leader>==", "mmggVG=`m", { desc = "Auto indent the whole file" })

function Close_hidden_buffers()
  local current = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(bufs) do
    if current ~= buf and vim.api.nvim_buf_is_loaded(buf) then
      local is_open = false
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
          is_open = true
          break
        end
      end
      if not is_open then
        vim.cmd("bd" .. buf)
      end
    end
  end
end

map("n", "<leader>qQ", Close_hidden_buffers, { desc = "Close all hidden buffers" })

map("n", "<leader>sp", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

function toggle_terminal()
  require("nvchad.term").toggle { pos = "sp", id = "lulzie-horizontal-terminal" }
end

function toggle_floating_terminal()
  require("nvchad.term").toggle { pos = "float", id = "lulzie-floating-terminal" }
end

--  TODO: There has to be a better way to map multiple keys to the same function
--  NOTE: Default mappings for Nvchad are <M-j> and <M-i> but I cannot find a way to remap alt/opt to meta for Ghostty terminal
-- if vim.env.TERM == "xterm-ghostty" then
map({ "n", "t" }, "ø", toggle_floating_terminal, { desc = "Toggle floating terminal" })
map({ "n", "t" }, "∆", toggle_terminal, { desc = "Toggle terminal" })
-- else
map({ "n", "t" }, "<M-o>", toggle_floating_terminal, { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<M-j>", toggle_terminal, { desc = "Toggle terminal" })
-- end

map("n", "<leader>ng", ":Neogit<cr>", { desc = "Neogit open" })

map("n", "<C-t>", function() require("nvchad.themes").open() end, { desc = "Nvchad open theme switcher" })
map("n", "<C-w>", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help" }) --  NOTE: Also available as <leader>sh

map("i", ",,", "<esc>ml$a,<esc>`l", { desc = "Insert a comma at the end of the line" })
map("i", ";;", "<esc>ml$a;<esc>`l", { desc = "Insert a comma at the end of the line" })

map("n", "<leader>qo", ":copen<cr>", { desc = "Quickfix open" })
map("n", "<leader>qc", ":cclose<cr>", { desc = "Quickfix close" })
map("n", "<leader>qn", ":cn<cr>", { desc = "Quickfix next" })
map("n", "<leader>qp", ":cp<cr>", { desc = "Quickfix previous" })

map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]], { noremap = true, silent = false, desc = "Replace word under cursor" })

map("c", "<M-b>", "<S-Left>", { noremap = true, desc = "Move one word left" })
map("c", "<M-f>", "<S-Right>", { noremap = true, desc = "Move one word right" })
map("c", "<C-a>", "<Home>", { noremap = true, desc = "Move to start of line" })
map("c", "<C-w>", "<C-w>", { noremap = true, desc = "Delete previous word " })
