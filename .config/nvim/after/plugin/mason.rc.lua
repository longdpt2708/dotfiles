local status_mason, mason = pcall(require, "mason")
if (not status_mason) then return end
local status_mason_lspconfig, lspconfig = pcall(require, "mason-lspconfig")
if (not status_mason_lspconfig) then return end

mason.setup({

})

lspconfig.setup {
  ensure_installed = {
    "sumneko_lua",
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "emmet_ls",
    "html",
    "jsonls",
    "tsserver",
    "marksman",
    "jedi_language_server",
    "sqlls",
    "tailwindcss",
    "terraformls",
    "lemminx",
    "yamlls",
    "tailwindcss",
    "graphql"
  },
}
