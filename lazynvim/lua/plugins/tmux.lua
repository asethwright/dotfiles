return {
  {
    "alexghergh/nvim-tmux-navigation",
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Navigate left window" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Navigate down window" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Navigate up window" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate right window" },
    },
    opts = {
      disable_when_zoomed = true,
    },
  },
}
