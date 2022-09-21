local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end
local tree_cb = nvim_tree_config.nvim_tree_callback

require("nvim-tree").setup({
  open_on_setup_file = true,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  open_on_tab = false,
  hijack_cursor = false,
  -- hijack_cursor = true,
  -- auto_close = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  --  quit_on_open = 0,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- renderer = {
  --   highlight_git = true,
  -- },
  diagnostics = {
    enable = true,
  },
  -- view = {
  --   hide_root_folder = false,
  --   side = "left",
  --   mappings = {
  --     custom_only = false,
  --     list = {
  --       { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
  --       { key = "h", cb = tree_cb "close_node" },
  --       { key = "v", cb = tree_cb "vsplit" },
  --     },
  --   },
  --   number = false,
  --   relativenumber = false,
  -- },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

local modifiedBufs = function(bufs)
    local t = 0
    for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
        vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
        modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
            vim.cmd "quit"
        end
    end
})
