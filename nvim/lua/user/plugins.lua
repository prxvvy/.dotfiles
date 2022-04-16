return require('packer').startup(function()
	use "ray-x/lsp_signature.nvim"
	use 'wbthomason/packer.nvim'
	use 'andrejlevkovitch/vim-lua-format'
	use("lifepillar/vim-gruvbox8")
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	}
	use "lukas-reineke/indent-blankline.nvim"
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
	use 'windwp/nvim-autopairs'
	use "ahmedkhalf/project.nvim"
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use { 'hrsh7th/nvim-cmp' }
	use 'hrsh7th/cmp-nvim-lsp'
	use "L3MON4D3/LuaSnip" --snippet engine
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'prettier/vim-prettier'
	use 'hrsh7th/cmp-path'
	use 'tibabit/vim-templates'
	use 'nvie/vim-flake8'
	use 'bfrg/vim-cpp-modern'
	use 'rhysd/vim-clang-format'
	use 'yegappan/disassemble'
	use 'psf/black'
	use 'vim-scripts/DoxygenToolkit.vim'
	use 'onsails/lspkind-nvim'
	use {
		'numToStr/Comment.nvim',
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		"folke/which-key.nvim"
	}

	use { "akinsho/toggleterm.nvim" }
	use "akinsho/bufferline.nvim"

	use 'lewis6991/impatient.nvim'

	use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
