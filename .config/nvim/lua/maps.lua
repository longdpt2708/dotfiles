local keymap = vim.keymap

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
-- keymap.set('n', ':NvimTreeToggle<cr>', '<C-b>')
keymap.set('n', '<C-b>', ':NvimTreeToggle<cr>')


-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', '<C-t>', ':tabedit<cr>')
