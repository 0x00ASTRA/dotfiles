-- treesitter-config.lua
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "c", "zig", "rust", "javascript", "html", "css", "markdown" },
  highlight = {
    enable = true,
  },
}

