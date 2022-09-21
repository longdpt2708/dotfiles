local keymap = vim.keymap

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<cr>')


-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', '<C-t>', ':tabedit<cr>')

-- Split window
-- keymap.set('n', 'ss', ':split<Return><C-w>w')
-- keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- -- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')
