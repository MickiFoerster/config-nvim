require("micki.packer")
require("micki.set")
require("micki.remap")

local function format_python()
	vim.cmd('silent !black %')
end

-- Function to format Python code using black
local function format_python()
    -- Save current cursor position
    local save_cursor = vim.fn.getcurpos()

    -- Create a temporary file
    local tmp = vim.fn.tempname()

    -- Write current buffer to temporary file
    vim.cmd('silent write ' .. tmp)

    -- Format the temporary file
    local format_cmd = 'black -q ' .. tmp
    local formatted = vim.fn.system(format_cmd)

    if vim.v.shell_error == 0 then
        -- Read the formatted content
        local lines = vim.fn.readfile(tmp)
        -- Replace buffer contents with formatted code
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        -- Restore cursor position
        vim.fn.setpos('.', save_cursor)
        -- Remove the temporary file
        vim.fn.delete(tmp)
    else
        vim.notify('Error formatting Python file', vim.log.levels.ERROR)
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
