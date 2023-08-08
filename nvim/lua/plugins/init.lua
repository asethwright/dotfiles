local lsp = require("plugins.lsp")
local telescope = require("plugins.telescope").deps
local neotree = require("plugins.neotree")
local gitsigns = require("plugins.gitsigns")
local illuminate = require("plugins.illuminate")
local trouble = require("plugins.trouble")
local github = require("plugins.github")
local tmux = require("plugins.tmux")
local comment = require("plugins.comment")
local octo = require("plugins.octo")
local ui = require("plugins.ui")
local copilot = require("plugins.copilot")

local plugins = {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "folke/lazy.nvim", tag = "stable" },
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = {
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			ensure_installed = {
				"bash",
				"c",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},
	{ "tpope/vim-fugitive" },
	{ "mbbill/undotree" },

	copilot,
	ui,
	octo,
	lsp,
	comment,
	telescope,
	neotree,
	gitsigns,
	illuminate,
	trouble,
	github,
	tmux,
}

return plugins
