local zen = require('zen-mode');

function toggle()
  zen.toggle({
      window = {
        width = 0.75,
      }
    })
end

vim.keymap.set('n', '<leader>z', function() toggle() end);
