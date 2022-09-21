local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup ({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end,
   sources = {
  --   null_ls.builtins.diagnostics.eslint_d.with({
  --     diagnostics_format = '[eslint] #{m}\n(#{c})'
  --   }),
  -- null_ls.builtins.code_actions.gitsigns,
  },
})

-- require("null-ls").setup({
--     sources = {
--         -- require("null-ls").builtins.formatting.stylua,
--         -- require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.formatting.shfmt, -- shell script formatting
--     require("null-ls").builtins.formatting.prettier, -- markdown formatting
--     },
-- })

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       -- diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     -- null_ls.builtins.diagnostics.zsh
--   },
--   on_attach = function(client, bufnr)
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

--       -- format on save
--       vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--     end

--     if client.resolved_capabilities.document_range_formatting then
--       vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
--     end
--   end,
-- })
