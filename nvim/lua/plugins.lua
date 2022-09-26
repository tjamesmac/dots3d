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
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"numToStr/Comment.nvim",
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
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
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

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	use({ "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" })

	use({ "RRethy/nvim-treesitter-textsubjects" })

	use("tpope/vim-surround")

	use("jose-elias-alvarez/typescript.nvim")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	-- use("rebelot/kanagawa.nvim")
end)
