local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("kike.lsp.mason")
require("kike.lsp.handlers").setup()
require("kike.lsp.null-ls")