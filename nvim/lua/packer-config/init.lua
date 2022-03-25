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
	 use 'kyazdani42/nvim-web-devicons'
	 use {
		 'SmiteshP/nvim-gps',
		 requires = "nvim-treesitter/nvim-treesitter"
	 }
	 use {
		 'nvim-lualine/lualine.nvim',
		 requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	 }
	 use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
	 use {'hrsh7th/nvim-cmp', requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
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
	 use 'onsails/lspkind-nvim' 
	 use {
		 'terrortylor/nvim-comment',
	 }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	 use {
		 "folke/which-key.nvim",
		 config = function()
			 require("which-key").setup ()
		 end
	 }
	use {
	  'kdheepak/tabline.nvim',
	  config = function()
		 require'tabline'.setup {
			-- Defaults configuration options
			enable = true,
			options = {
			-- If lualine is installed tabline will use separators configured in lualine by default.
			-- These options can be used to override those settings.
			  section_separators = {'', ''},
			  component_separators = {'', ''},
			  max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
			  show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
			  show_devicons = true, -- this shows devicons in buffer section
			  show_bufnr = false, -- this appends [bufnr] to buffer section,
			  show_filename_only = false, -- shows base filename only instead of relative path in filename
			  modified_icon = "+ ", -- change the default modified icon
			  modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
			}
		 }
		 vim.cmd[[
			set guioptions-=e " Use showtabline in gui vim
			set sessionoptions+=tabpages,globals " store tabpages and globals in session
		 ]]
	  end,
	  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}
end)
