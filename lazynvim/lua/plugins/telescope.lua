return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      config = function()
        require("telescope").load_extension("undo")
      end,
    },
    keys = {
      { "<C-space>", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader><space>", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo history" },
      {
        "<leader>o",
        function()
          require("telescope.builtin").lsp_document_symbols({
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
            },
          })
        end,
        { desc = "Goto symbol" },
      },
    },
    opts = {
      pickers = {
        buffers = {
          initial_mode = "normal",
          show_all_buffers = true,
          sort_mru = true,
          mappings = {
            i = {
              ["<C-d>"] = function(...)
                require("telescope.actions").delete_buffer(...)
              end,
            },
            n = {
              ["v"] = function(...)
                require("telescope.actions").file_vsplit(...)
              end,
              ["s"] = function(...)
                require("telescope.actions").file_split(...)
              end,
              ["d"] = function(...)
                require("telescope.actions").delete_buffer(...)
              end,
              ["c"] = function(...)
                require("telescope.actions").delete_buffer(...)
              end,
              ["<C-j>"] = function(...)
                require("telescope.actions").move_selection_next(...)
              end,
              ["<C-k>"] = function(...)
                require("telescope.actions").move_selection_previous(...)
              end,
            },
          },
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-n>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["v"] = function(...)
              require("telescope.actions").file_vsplit(...)
            end,
            ["s"] = function(...)
              require("telescope.actions").file_split(...)
            end,
            ["<C-n>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
        },
      },
    },
  },
}
