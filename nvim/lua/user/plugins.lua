return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- colorscheme
	use 'morhetz/gruvbox'
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
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-nvim-lsp'

	use "neovim/nvim-lspconfig" -- enable LSP
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use "akinsho/bufferline.nvim"
	use 'tibabit/vim-templates'
	use 'rhysd/vim-clang-format'
	use 'prettier/vim-prettier' 
	use 'psf/black'
	use 'akinsho/toggleterm.nvim'
end)
