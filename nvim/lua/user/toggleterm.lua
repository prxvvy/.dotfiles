local status_ok, toggleterm = pcall(require, "toggleterm")
local settings = require 'user.settings'

local keymap = settings.keymap
local cmd = settings.cmd
local buffKeymap = settings.buffKeymap

if not status_ok then
    return
end

require("toggleterm").setup{
   -- direction = "float",
	size = 23,
   direction = "horizontal",
   shade_terminals = false,
   persist_size = false,
}


function _G.set_terminal_keymaps()
  local opts = {noremap = true, silent = true}
  keymap('t', '<esc>', '<cmd>lua _MYTERM_TOGGLE()<CR>', opts)
end

cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local opts = { noremap = true, silent = true }

local close_terminal = function(term)
    buffKeymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
end

local myterm = Terminal:new({
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _MYTERM_TOGGLE()
    myterm:toggle()
end

keymap(
    "n",
    "<C-t>",
    "<cmd>lua _MYTERM_TOGGLE()<CR>",
    opts
)

keymap(
    "t",
    "<C-t>",
    "<cmd>lua _MYTERM_TOGGLE()<CR>",
    opts
)
