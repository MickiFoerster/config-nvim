require("micki.packer")
require("micki.set")
require("micki.remap")

local function format_python()
    -- Save cursor position
    local save_cursor = vim.fn.getcurpos()

    -- Get the current file path
    local file = vim.fn.expand('%')

    -- Format using Ruff
    local format_cmd = 'ruff format ' .. vim.fn.shellescape(file)
    local result = vim.fn.system(format_cmd)

    if vim.v.shell_error == 0 then
        -- Reload buffer to reflect formatted content
        vim.cmd('edit!')
        -- Restore cursor position
        vim.fn.setpos('.', save_cursor)
    else
        vim.notify('Error formatting Python file with Ruff:\n' .. result, vim.log.levels.ERROR)
    end
end

-- Create an autocommand group for Python formatting
vim.api.nvim_create_augroup('PythonFormatting', { clear = true })

-- Auto-format on save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'PythonFormatting',
    pattern = '*.py',
    callback = format_python
})

-- Optional: Create a command to manually trigger formatting
vim.api.nvim_create_user_command('FormatPython', format_python, {})
