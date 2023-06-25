-- General
vim.keymap.set('n', '<leader>init', ':<C-u>edit $MYVIMRC<CR>', {noremap = true})

-- Move
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })

-- Window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', { noremap = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true })

vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-w><left>', '<C-w><', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w><right>', '<C-w>>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w><up>', '<C-w>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w><down>', '<C-w>-', { noremap = true })
vim.api.nvim_set_keymap('n', 's-', '<C-w>_', { noremap = true })
vim.api.nvim_set_keymap('n', 's\\', '<C-w>|', { noremap = true })
vim.api.nvim_set_keymap('n', 'sz', '<C-w>_<C-w>|', { noremap = true })
vim.api.nvim_set_keymap('n', 's=', '<C-w>=', { noremap = true })

-- Buffer
vim.api.nvim_set_keymap('n', '<C-j>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bprev<CR>', { noremap = true })

-- Tab
vim.api.nvim_set_keymap('n', 'te', ':tabedit ', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprev<Return>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<Return>', { noremap = true })

-- Plugin keybinds
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>Lspsaga outline<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<A-d>', '<cmd>Lspsaga term_toggle<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('t', '<A-d>', '<cmd>Lspsaga term_toggle<CR>', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>xc', '<Cmd>BufferClose<CR>', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {silent = true, noremap = true})
