local plugins = {

    "nvim-lua/plenary.nvim",
    {
        "prettier/vim-prettier",
        cmd = { "Prettier", "PrettierAsync" },
    },
    {
        "psf/black",
        cmd = "Black"
    },
    {
        "rhysd/vim-clang-format",
        cmd = { "ClangFormat" },
        init = require("core.utils").load_mappings "clang_format",
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        int = require("core.utils").load_mappings("undotree")
    },
    {
        "windwp/nvim-ts-autotag",
        init = require("core.utils").lazy_load("nvim-ts-autotag"),
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        init = require("core.utils").load_mappings("nvimtree"),
        opts = function()
            return require("plugins.configs.nvimtree")
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        init = require("core.utils").load_mappings "telescope",
        opts = function()
            return require "plugins.configs.telescope"
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            telescope.setup(opts)

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = function()
            return require("plugins.configs.mason")
        end,
        config = function(_, opts)
            require("mason").setup(opts)

            -- custom nvchad cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },
    {
        "neovim/nvim-lspconfig",
        init = require("core.utils").lazy_load("nvim-lspconfig"),
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("plugins.configs.others").luasnip(opts)
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require("plugins.configs.cmp")
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        opts = function()
            return require("plugins.configs.toggleterm")
        end,
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
    },
    {
        "mcauley-penney/tidy.nvim",
        event = "BufWritePre",
        config = function()
            require("tidy").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        -- keys = { "gc", "gb" },
        init = require("core.utils").load_mappings "comment",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("ui.icons").devicons }
        end,
        config = function(_, opts)
            require("nvim-web-devicons").setup(opts)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        init = function()
            require("core.utils").lazy_load "indent-blankline.nvim"
        end,
        opts = function()
            return require("plugins.configs.others").blankline
        end,
        config = function(_, opts)
            require("core.utils").load_mappings "blankline"
            require("indent_blankline").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        init = require("core.utils").lazy_load("nvim-treesitter"),
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require("plugins.configs.treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

local config = require("core.utils").load_config()

-- lazy_nvim startup opts
local lazy_config = vim.tbl_deep_extend("force", require("plugins.configs.lazy_nvim"), config.lazy_nvim)

require("lazy").setup(plugins, lazy_config)
