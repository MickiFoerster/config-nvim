local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'anakin_language_server',
    'tsserver',
    'eslint',
    'gopls',
    'clangd',
    'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


local opts = {}
vim.keymap.set('n', "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set('n', "gD", function() vim.lsp.buf.declaration() end, opts)
vim.keymap.set('n', "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set('n', "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set('n', "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set('n', "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set('n', "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set('n', "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set('n', "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set('n', "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.setup()
