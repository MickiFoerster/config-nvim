require("micki.packer")
require("micki.set")
require("micki.remap")

local function format_python()
    -- Save cursor position
    local save_cursor = vim.fn.getcurpos()

    -- Get buffer content
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, "\n")

    -- Format using Ruff via stdin/stdout
    local result = vim.fn.system('ruff format -', content)

    if vim.v.shell_error == 0 then
        -- Split the result into lines
        local formatted_lines = {}
        for line in result:gmatch("[^\r\n]+") do
            table.insert(formatted_lines, line)
        end

        -- Replace buffer content with formatted content
        vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted_lines)

        -- Restore cursor position
        vim.fn.setpos('.', save_cursor)
    else
        vim.notify('Error formatting Python file with Ruff:\n' .. result, vim.log.levels.ERROR)
    end
end

-- Set up the autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = format_python,
})


-- Set up the autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = format_python,
})


-- Set up the autocommand to run before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = format_python,
})


-- Set up the autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = format_python,
})

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
