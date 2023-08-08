local M = {}

M.symbols = function ()
  local telescope = require("telescope.builtin")
  telescope.lsp_document_symbols({
    symbols = {
      "Class",
      "Function",
      "Method",
      "Constructor",
      "Interface",
      "Module",
      "Struct",
      "Trait",
      "Field",
      "Property",
    }
  })
end

M.deps = {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    config = function()
      M.setup()
    end,
    dependencies = {
      "telescope-fzf-native.nvim", "nvim-lua/plenary.nvim"
    },
    lazy = true,
    cmd = "Telescope",
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true},
}

M.setup = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.load_extension("fzf")
  telescope.setup({
    defaults = {
      color_devicons = false,
      mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<CR>"] = actions.select_default,
        },
        n = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        }
      }
    },
    pickers = {
      find_files = {
        hidden = true
      },
      buffers = {
        initial_mode = "normal",
        show_all_buffers = true,
        sort_mru = true,
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["d"] = actions.delete_buffer,
          },
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })
end

return M
