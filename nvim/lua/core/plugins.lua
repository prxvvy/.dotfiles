-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	-- UI
	use "kyazdani42/nvim-web-devicons"
	use "kyazdani42/nvim-tree.lua"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	use "folke/lsp-colors.nvim"
	use {
		"nvim-telescope/telescope.nvim",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
    use("mbbill/undotree")
    use "nvim-lualine/lualine.nvim"
	-- LSP
    use {
      "VonHeikemen/lsp-zero.nvim",
      requires = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},             -- Required
        {"williamboman/mason.nvim"},           -- Optional
        {"williamboman/mason-lspconfig.nvim"}, -- Optional

        -- Autocompletion
        {"hrsh7th/nvim-cmp"},         -- Required
        {"hrsh7th/cmp-nvim-lsp"},     -- Required
        {"hrsh7th/cmp-buffer"},       -- Optional
        {"hrsh7th/cmp-path"},         -- Optional
        {"saadparwaiz1/cmp_luasnip"}, -- Optional
        {"hrsh7th/cmp-nvim-lua"},     -- Optional

        -- Snippets
        {"L3MON4D3/LuaSnip"},             -- Required
        {"rafamadriz/friendly-snippets"}, -- Optional
      }
    }
	-- Editing support
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use "norcalli/nvim-colorizer.lua"
	-- Util
	use "rhysd/vim-clang-format"
	use "prettier/vim-prettier"
	use "psf/black"
	use "nvie/vim-flake8"
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "bfrg/vim-cpp-modern"
	use "numToStr/Comment.nvim"
	use {
		"kkoomen/vim-doge",
		run = ":call doge#install()"
	}
	use({
		"mcauley-penney/tidy.nvim",
		config = function()
			require("tidy").setup()
		end
	})
	-- Colorschemeuse
    -- use "RRethy/nvim-base16"
    use "ellisonleao/gruvbox.nvim"
	-- Terminal Integration
	use "akinsho/toggleterm.nvim"
end)
