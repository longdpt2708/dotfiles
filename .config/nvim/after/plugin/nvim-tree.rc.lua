local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

require("nvim-tree").setup()
