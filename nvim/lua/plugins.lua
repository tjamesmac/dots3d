local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require("packer").startup(function()
	local use = require("packer").use

	use("wbthomason/packer.nvim")
	use({ "nvim-lua/plenary.nvim" })
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

	use("tpope/vim-surround")

	use("jose-elias-alvarez/typescript.nvim")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use { "folke/tokyonight.nvim" }

  use { "mbbill/undotree" }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
