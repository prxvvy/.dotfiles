return require('packer').startup(function ()
	use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim'
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
	 use { 'feline-nvim/feline.nvim', tag = 'v0.1' }
	 use 'kyazdani42/nvim-web-devicons'
	 use {
		 'SmiteshP/nvim-gps',
		 requires = "nvim-treesitter/nvim-treesitter"
	 }
	 use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
	 use 'hrsh7th/nvim-cmp'
	 use 'hrsh7th/cmp-nvim-lsp'
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
end)
