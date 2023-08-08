local util = require("util")

group = vim.api.nvim_create_augroup("BackgroundWatch", { clear = true })
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGWINCH",
  callback = util.debounce(500, util.setSchemes),
  group = group,
})
