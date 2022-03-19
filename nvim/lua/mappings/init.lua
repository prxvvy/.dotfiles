local settings = require 'settings'


settings.glob.mapleader = ','

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

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
