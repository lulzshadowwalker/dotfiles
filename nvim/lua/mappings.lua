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
map("n", "<leader>qo", Close_others, { desc = "Close all open buffers except current one" })

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
