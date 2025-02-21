
local M = {}

function M.open_file_at_line()
  local line = vim.fn.getline('.')
  local pattern = "([^:]+):(%d+):"
  local file, line_number = line:match(pattern)
  if file and line_number then
    vim.cmd('edit ' .. file)
    vim.cmd(line_number)
  else
    print("Pattern not found in the current line")
  end
end

return M

