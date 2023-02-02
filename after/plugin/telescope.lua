

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')




local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fv', builtin.git_files, {})
vim.keymap.set('n', '<leader>fvc', builtin.git_commits, {})

vim.keymap.set('n', "<leader>td", builtin.lsp_definitions, {})
vim.keymap.set('n', "<leader>tD", builtin.lsp_type_definitions, {})
vim.keymap.set('n', "<leader>ti", builtin.lsp_implementations, {})
vim.keymap.set('n', "<leader>tr", builtin.lsp_references, {})
vim.keymap.set('n', "<leader>tw", builtin.lsp_workspace_symbols, {})


-- builtin.lsp_references	Lists LSP references for word under the cursor
-- builtin.lsp_incoming_calls	Lists LSP incoming calls for word under the cursor
-- builtin.lsp_outgoing_calls	Lists LSP outgoing calls for word under the cursor
-- builtin.lsp_document_symbols	Lists LSP document symbols in the current buffer
-- builtin.lsp_workspace_symbols	Lists LSP document symbols in the current workspace
-- builtin.lsp_dynamic_workspace_symbols	Dynamically Lists LSP for all workspace symbols
-- builtin.diagnostics	Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
-- builtin.lsp_implementations	Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
-- builtin.lsp_definitions	Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
-- builtin.lsp_type_definitions	Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope


-- ripgrep keypmap
--vim.keymap.set('n', '<leader>frg', function()
--	builtin.grep_string({ search = vim.fn.expand("<cword>") });
--end)


