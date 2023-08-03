function current_buffer_directory()
  local path = vim.fn.expand('%:p:h')
  if path == "" then
    return vim.b[0].netrw_curdir 
  else
    return path
  end
end
