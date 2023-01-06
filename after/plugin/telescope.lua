local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
--vim.keymap.set('n', '<leader>fgr', function()
--	builtin.grep_string({ search = vim.fn.expand("<cword>") });
--end)
--vim.keymap.set('n', '<C-g>', ":grep -R X" .. vim.fn.expand("<cfile>") .. "X .<CR>")
