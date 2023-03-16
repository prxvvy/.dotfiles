local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

map('n', '<F3>', ':ClangFormat<CR>', opts)
map('n', '<leader>b', ':Black<CR>', opts)
map('n', '<leader>do', ':DogeGenerate<CR>', opts)

-- Telescope

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>fo', ':Telescope commands<CR>', opts)
map('n', '<leader>pf', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

map('n', '<leader>fq', ':Telescope quick_fix<CR>', opts)
map('n', '<leader>fgs', ':Telescope git_status<CR>', opts)
map('n', '<leader>fgf', ':Telescope git_files<CR>', opts)
map('n', '<leader>fgc', ':Telescope git_commits<CR>', opts)
map('n', '<leader>fgb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>fgt', ':Telescope git_stash<CR>', opts)

--

map('n', '<F2>', ':NvimTreeToggle<CR>', opts) -- Toggle NvimTree

map('n', 'H', '^', opts)
map('n', 'L', 'g_', opts)

map('c', 'w!!', '!sudo tee % >/dev/null', opts) -- Sudo to write protected file

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv'")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv'")

map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map('', '<up>', '<nop>', opts)
map('', '<down>', '<nop>', opts)
map('', '<left>', '<nop>', opts)
map('', '<right>', '<nop>', opts)
map('n', '<leader>e', ':e $MYVIMRC<CR>', opts)
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', 'S-TAB>', ':bprevious<CR>', opts)
map('n', '<A-l>', ':vertical resize +5<CR>', opts)
map('n', '<A-h>', ':vertical resize -5<CR>', opts)
map('n', '<A-j>', ':resize +5<CR>', opts)
map('n', '<A-k>', ':resize -5<CR>', opts)
map('n', ';', ':', opts)
map('n', '<Esc>', ':nohlsearch<CR>', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('v', "<", '<gv', opts)
map('v', '>', '>gv', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-q>', ':q <CR>', opts)
map('n', '<C-n>', ':bd<CR>', opts)
map('n', '<leader>so', ':so%<CR>', opts)
map('n', '<A-o>', ':!touch<Space>', opts)
map('n', '<A-b>', ':!crf<Space>', opts)
map('n', '<A-d>', ':!mkdir<Space>', opts)
map('n', '<A-m>', ':!mv<Space>%<Space>', opts)
map('n', '<C-a>', '0', opts)
map('n', '<C-e>', '$', opts)
map('n', '<C-a>', '<C-o>0', opts)
map('n', '<C-e>', '<C-o>$', opts)
map('n', '<C-a>', '<Home>', opts)
map('n', '<C-e>', '<End>', opts)
map('n', '<C-Up>', '<C-e>', opts)
map('n', '<C-Down>', '<C-y>', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mzJ`z', opts)
map('n', '<A-b>', '<C-Left>', opts)
map('n', '<A-f>', '<C-Right>', opts)
map('n', '<A-BS>', '<C-w>', opts)
map('n', '<A-d>', '<C-o>dw', opts)
map('n', '<A-b>', '<C-Left>', opts)
map('n', '<A-f>', '<C-Right>', opts)
map('n', '<A-BS>', '<C-w>', opts)
map('n', '<A-d>', '<C-Right><C-w>', opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)
map('n', '+', 'g<C-a>', opts)
map('n', '-', 'g<C-x>', opts)
map('n', 'Y', 'y$', opts)
