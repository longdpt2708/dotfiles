local status, dap = pcall(require, "dap")
if not status then
  -- print("The dap extension could not be loaded")
  return
end

dap.set_log_level("DEBUG")

-- vim.highlight.create('DapBreakpoint', { ctermbg = 0, guifg = '#993939', guibg = '#31353f' }, false)
-- vim.highlight.create('DapLogPoint', { ctermbg = 0, guifg = '#61afef', guibg = '#31353f' }, false)
-- vim.highlight.create('DapStopped', { ctermbg = 0, guifg = '#98c379', guibg = '#31353f' }, false)
local set = vim.fn
set.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint',
  numhl = 'DapBreakpoint' })
set.sign_define('DapBreakpointCondition',
  { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
set.sign_define('DapBreakpointRejected',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
set.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
set.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })


-- vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<CS-F5>', ':lua require"dap".run_last()<CR>')
vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F10>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F11>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F12>', ':lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
-- vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
-- vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
-- vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
-- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})



local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


require('telescope').load_extension('dap')
