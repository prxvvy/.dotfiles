return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- colorscheme
	use 'folke/lsp-colors.nvim'
	use { "ellisonleao/gruvbox.nvim" }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use "windwp/nvim-autopairs"

	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path"
	-- use 'hrsh7th/vim-vsnip'
	use "L3MON4D3/LuaSnip"
	use 'hrsh7th/cmp-nvim-lsp'
	use "saadparwaiz1/cmp_luasnip"

	use "neovim/nvim-lspconfig" -- enable LSP
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'kyazdani42/nvim-web-devicons'
	use 'tibabit/vim-templates'
	use 'rhysd/vim-clang-format'
	use 'prettier/vim-prettier'
	use 'psf/black'
	use 'numToStr/Comment.nvim'
	use 'nvie/vim-flake8'
	use 'yegappan/disassemble'
	use 'bfrg/vim-cpp-modern'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
