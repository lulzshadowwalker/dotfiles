require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<Leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" })
map("n", "<Leader>tf", ":TestFile<CR>", { desc = "Test File" })
map("n", "<Leader>ts", ":TestSuite<CR>", { desc = "Test Suite" })
map("n", "<Leader>tl", ":TestLast<CR>", { desc = "Test Last" })
map("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Test Visit" })

function Close_others()
  local current = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(bufs) do
    if current ~= buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.cmd("bd" .. buf)
    end
  end
end

map("n", "<leader>qq", "<cmd>bufdo bd<CR>", { desc = "Close all open buffers" })
map("n", "<leader>qo", Close_others, { desc = "Close all open buffers except current one" })

