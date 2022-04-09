local settings = require 'settings'

settings.glob.mapleader = ','
local keymap = settings.keymap
local tbl = settings.tbl

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = tbl('force', options, opts)
  end
  keymap(mode, lhs, rhs, options)
end

-- Move to first non-blank or last non-blank character in current line
map('n', 'H', '^')
map('n', 'L', 'g_')

-- Sudo to write protected file
map('c', 'w!!', '!sudo tee % >/dev/null')

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>fb', ':Telescope buffers<CR>')
map('n', '<Leader>fh', ':Telescope help_tags<CR>')

map('n', '<Leader>fo', ':Telescope commands<CR>')
map('n', '<Leader>fq', ':Telescope quick_fix<CR>')
map('n', '<Leader>fgs', ':Telescope git_status<CR>')
map('n', '<Leader>fgf', ':Telescope git_files<CR>')
map('n', '<Leader>fgc', ':Telescope git_commits<CR>')
map('n', '<Leader>fgb', ':Telescope git_branches<CR>')
map('n', '<Leader>fgt', ':Telescope git_stash<CR>')

map('n', '<F2>', ':NvimTreeToggle<CR>')
map('n', '<F3>', ':TemplateInit<CR>')
map('n', '<F4>', ':ClangFormat<CR>')
map('n', '<leader>e', ':e $MYVIMRC<CR>')
map('n', '<TAB>', ':bnext<CR>')
map ('n', 'S-TAB>', ':bprevious<CR>')
map('n', '<A-l>', ':vertical resize +5<CR>')
map('n', '<A-h>', ':vertical resize -5<CR>')
map('n', '<A-j>', ':resize +5<CR>')
map('n', '<A-k>', ':resize -5<CR>')
map('n', ';', ':')
map('n', ',/', ':nohlsearch<CR>')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('v', "<", '<gv')
map('v', '>', '>gv')

map('n', '<C-w>', ':w<CR>')
map('n', '<C-q>', ':q <CR>')
map('n', '<C-b>', ':bd<CR>')
map('n', '<leader>so', ':so%<CR>')

map('n', '<leader>p', ':Prettier<CR>')
map('n', '<leader>b', ':Black<CR>')

map ('n', '<A-o>', ':!touch<Space>')
map('n', '<A-b>', ':!crf<Space>')
map('n', '<A-d>', ':!mkdir<Space>')
map('n', '<A-m>', ':!mv<Space>%<Space>')

map('n', '<C-a>', '0')
map('n', '<C-e>', '$')
map('n', '<C-a>', '<C-o>0')
map('n', '<C-e>', '<C-o>$')
map('n', '<C-a>', '<Home>')
map('n', '<C-e>', '<End>')

map('n', '<C-Up>', '<C-e>')
map('n', '<C-Down>', '<C-y>')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

map('n', '<A-b>', '<C-Left>')
map('n', '<A-f>', '<C-Right>')
map('n', '<A-BS>', '<C-w>')
map('n', '<A-d>', '<C-o>dw')
map('n', '<A-b>', '<C-Left>')
map('n', '<A-f>', '<C-Right>')
map('n', '<A-BS>', '<C-w>')
map('n', '<A-d>', '<C-Right><C-w>')

map('n', '+', '<C-a>')
map('n', '-', '<C-x>')
map('n', '+', 'g<C-a>')
map('n', '-', 'g<C-x>')

map('n', 'Y', 'y$')
