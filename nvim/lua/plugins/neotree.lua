return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      filesystem = {
        follow_current_file = true,
      },
      window = {
        mappings = {
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end
        },
      },
    },
    dependencies = {
      "nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = true
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true }
}
