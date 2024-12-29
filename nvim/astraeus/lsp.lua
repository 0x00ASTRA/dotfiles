-- lsp.lua
local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup {}

-- C/C++
lspconfig.clangd.setup {}

-- Rust
lspconfig.rust_analyzer.setup {}

-- Zig
lspconfig.zls.setup {}

-- Kerboscript

local lspconfig = require('lspconfig')

-- Define kos_language_server as a custom configuration
local configs = require('lspconfig.configs')

if not configs.kos_language_server then
  configs.kos_language_server = {
    default_config = {
      cmd = { "kls", "--stdio" }, -- Adjust to "kos-language-server" if "kls" doesn't work
      filetypes = { "kerboscript" },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end,
      settings = {},
    },
  }
end

-- Setup kos_language_server
lspconfig.kos_language_server.setup {}
-- Autocompletion
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
  },
})

