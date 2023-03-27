-- n, v, i, t = mode names

local M = {}

M.general = {
    i = {
        -- Go to  beginning and end

        ["<C-a>"] = { "<C-o>^", "beginning of line" },
        ["<C-e>"] = { "<C-o>g_", "end of line" },
        -- Navigate within insert mode

        ["<C-h>"] = { "<Left>", "move left" },
        ["<C-l>"] = { "<Right>", "move right" },
        ["<C-j>"] = { "<Down>", "move down" },
        ["<C-k>"] = { "<Up>", "move up" },
        -- Remap up, down, left and right arrow key  so that we can't use those in insert mode. Who needs them?

        ["<up>"] = { "<nop>", "map up arrow key" },
        ["<down>"] = { "<nop>", "map down arrow key" },
        ["<left>"] = { "<nop>", "map left arrow key" },
        ["<right>"] = { "<nop>", "map right arrow key" },
    },
    n = {
        -- Switch between windows.

        ["<C-h>"] = { "<C-w>h", "window left" },
        ["<C-l>"] = { "<C-w>l", "window right" },
        ["<C-j>"] = { "<C-w>j", "window down" },
        ["<C-k>"] = { "<C-w>k", "window up" },
        -- Save

        ["<C-s>"] = { "<cmd> w <CR>", "save current file" },
        -- Quit

        ["<C-q>"] = { "<cmd> q <CR>", "quit neovim" },
        -- Go to next Buffer
        ["<TAB>"] = { "<cmd> bnext <CR>", "go to next buffer" },
        -- Go to previous buffer
        ["<S-TAB>"] = { "<cmd> bprevious <CR>", "go to previous buffer" },
        -- Close current buffer

        ["<leader>b"] = { "<cmd> bd <CR>", "close current buffer" },
        -- Source current buffer

        ["<leader>so"] = { "<cmd> so% <CR>", "source current file" },
        -- Open init.lua

        ["<leader>e"] = { "<cmd> e$MYVIMRC <CR>", "go init.lua config file" },
        -- Get into command mode

        [";"] = { "<cmd> : <CR>", "get into command mode" },
        -- Resize splits

        ["<A-l>"] = { "<cmd> vertical resize +5 <CR>", "resize +5 vertically" },
        ["<A-h>"] = { "<cmd> vertical resize -5 <CR>", "resize -5 vertically" },
        ["<A-j>"] = { "<cmd> resize +5 <CR>", "resize +5" },
        ["<A-k>"] = { "<cmd> resize -5 <CR>", "resize -5" },
        -- Remap up, down, left and right arrow key  so that we can't use those in normal mode. Who needs them?

        ["<up>"] = { "<nop>", "map up arrow key" },
        ["<down>"] = { "<nop>", "map down arrow key" },
        ["<left>"] = { "<nop>", "map left arrow key" },
        ["<right>"] = { "<nop>", "map right arrow key" },
        -- Go to  beginning and end
        ["H"] = { "^", "beginning of line" },
        ["L"] = { "g_", "end of line" },
        -- Idk what these is for but theprime uses it so

        ["<C-d>"] = { "<C-d>zz", "" },
        ["<C-u>"] = { "<C-u>zz", "" },
        ["n"] = { "nzzzv", "" },
        ["N"] = { "Nzzzv", "" },
        ["J"] = { "mzJ`z", "" },
        ["Y"] = { "Y$", "" },
        ["<C-up>"] = { "<C-e>", "" },
        ["<C-down>"] = { "<C-y>", "" },
        ----
        ["<leader>x"] = { "<cmd> !chmod +x % <CR>", "make a file executable" },
        ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "replace a word" }
    },
    v = {
        -- Indent blocks of code in visual mode with >< keys

        ["<"] = { "<gv", "indent blocks of code to the left" },
        [">"] = { ">gv", "indent blocks of code to the right" },
        -- Move blocks of code

        ["J"] = { "<cmd> m '>+1<CR>gv=gv'", "move blocks of code up" },
        ["K"] = { "<cmd> m '<-2<CR>gv=gv'", "move blocks of code down" },
        -- Go to  beginning and end

        ["H"] = { "^", "beginning of line" },
        ["L"] = { "g_", "end of line" },
    },
    c = {
        ["w!!"] = { "!sudo tee % > /dev/null", "sudo to write protected files" }
    }
}

M.comment = {
    plugin = true,
    -- toggle comment in both modes
    n = {
        ["<leader>gcc"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment",
        },
        ["<leader>gbc"] = {
            function()
                require("Comment.api").toggle.blockwise.current()
            end,
            "toggle comment",
        },
    },
    v = {
        ["<leader>gc"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
        ["<leader>gb"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
    },
}

M.lspconfig = {
    plugin = true,
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "lsp declaration",
        },
        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "lsp definition",
        },
        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "lsp hover",
        },
        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "lsp implementation",
        },
        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "lsp signature_help",
        },
        ["<leader>D"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "lsp definition type",
        },
        ["<leader>ra"] = {
            function()
                require("ui.renamer").open()
            end,
            "lsp rename",
        },
        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "lsp code_action",
        },
        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "lsp references",
        },
        ["<leader>f"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "floating diagnostic",
        },
        ["[d"] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "goto prev",
        },
        ["]d"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "goto_next",
        },
        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "diagnostic setloclist",
        },
        ["<space>f"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "lsp formatting",
        },
        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "add workspace folder",
        },
        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "remove workspace folder",
        },
        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "list workspace folders",
        },
    },
}

M.blankline = {
    plugin = true,
    n = {
        ["<leader>cc"] = {
            function()
                local ok, start = require("indent_blankline.utils").get_current_context(
                    vim.g.indent_blankline_context_patterns,
                    vim.g.indent_blankline_use_treesitter_scope
                )

                if ok then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                    vim.cmd [[normal! _]]
                end
            end,

            "Jump to current_context",
        },
    },
}

M.clang_format = {
    plugin = true,
    n = {
        ["<F2>"] = { "<cmd> ClangFormat <CR>", "format C/C++ files and more" }
    }
}

M.undotree = {
    plugin = true,
    n = {
        ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" }
    }
}


M.nvimtree = {
    plugin = true,
    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    },
}

M.telescope = {
    plugin = true,
    n = {
        ["<leader>pf"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader><space>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>vh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>?"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>/"] = { function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, "fuzzy find in current buffer" },
        -- git

        ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
        ["<leader>fgf"] = { "<cmd> Telescope git_files <CR>", "git files" },
        ["<leader>fgb"] = { "<cmd> Telescope git_branches <CR>", "git branches" },
        ["<leader>fgt"] = { "<cmd> Telescope git_stash <CR>", "git stash" },
    }
}

return M
