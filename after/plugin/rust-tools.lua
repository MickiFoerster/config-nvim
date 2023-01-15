local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})


-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'E',texthl='DiagnosticSignError', linehl='', numhl='DiagnosticSignError' })
sign({name = 'DiagnosticSignWarn', text = 'W', texthl='DiagnosticSignWarn', linehl='', numhl='DiagnosticSignWarn'})
sign({name = 'DiagnosticSignHint', text = 'H', texthl='DiagnosticSignInfo', linehl='', numhl='DiagnosticSignInfo' })
sign({name = 'DiagnosticSignInfo', text = 'I', texthl='DiagnosticSignHint', linehl='', numhl='DiagnosticSignHint'})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
