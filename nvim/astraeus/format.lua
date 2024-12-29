-- format.lua
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier, -- JS, HTML, CSS
    null_ls.builtins.formatting.black,    -- Python
    null_ls.builtins.formatting.clang_format, -- C/C++
  },
})

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

