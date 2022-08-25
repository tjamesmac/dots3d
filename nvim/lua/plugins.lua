return require("packer").startup(function()
	local use = require("packer").use

	use("wbthomason/packer.nvim")
	use({ "nvim-lua/plenary.nvim" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
	})

	use({
		"phaazon/hop.nvim",
		-- branch = "v2",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"numToStr/Comment.nvim",
	})

	use("rebelot/kanagawa.nvim")

	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})

	use({ "feline-nvim/feline.nvim" })

	use({
		"lewis6991/gitsigns.nvim",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	use("windwp/nvim-autopairs")

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("neovim/nvim-lspconfig")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- THEME
	use("projekt0n/github-nvim-theme")

	-- AUTOCOMPLETION
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind.nvim")
	use({ "hrsh7th/nvim-cmp", events = { "InsertEnter" } })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	use({ "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" })

	use({ "RRethy/nvim-treesitter-textsubjects" })

	use("tpope/vim-surround")

	use("jose-elias-alvarez/typescript.nvim")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	use("ray-x/go.nvim")

	-- use("github/copilot.vim")
end)
