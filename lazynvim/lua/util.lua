local M = {}
local Job = require("plenary.job")

M.debounce = function(ms, fn)
  local running = false
  return function()
    if running then
      return
    end
    vim.defer_fn(function()
      running = false
    end, ms)
    running = true
    vim.schedule(fn)
  end
end

M.setSchemes = function()
  M.setColorScheme()
  M.setLuaLineScheme()
end

M.setColorScheme = function()
  local scheme = M.getScheme()
  vim.cmd("colorscheme " .. scheme)
end

M.setLuaLineScheme = function()
  local scheme = M.getScheme()
  require("lualine").setup({
    options = {
      theme = scheme,
    },
  })
end

M.getScheme = function()
  local j = Job:new({ command = "defaults", args = { "read", "-g", "AppleInterfaceStyle" } })
  j:sync()
  -- return j:result()[1] == "Dark" and "catppuccin" or "catppuccin-latte"
  return j:result()[1] == "Dark" and "github_dark" or "github_light"
end

return M
