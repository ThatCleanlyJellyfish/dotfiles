-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<space><space>', 'za', { desc = 'Toggle fold' })

vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = "Swap mapping of ';' and ':' to make ex commands easier." })
vim.keymap.set({ 'n', 'v' }, ':', ';', { desc = "Swap mapping of ';' and ':' to make ex commands easier." })
vim.keymap.set('n', 'gf', ':e <cfile><CR>', { desc = 'gf creates the file if it does not exist' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Diagnostic config
vim.diagnostic.config {
  float = { border = 'rounded' },
}

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows or create a new split.
local focusmap = function(direction)
  vim.keymap.set('n', '<C-' .. direction .. '>', function()
    require('focus').split_command(direction)
  end, { desc = string.format('Create or move to split (%s)', direction) })
end
focusmap 'h'
focusmap 'j'
focusmap 'k'
focusmap 'l'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
