local status, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if (not status) then return end

require("nvim-dap-virtual-text").setup()
