-- pluginsconfig.lua

-- Telescope Configuration
require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            ".git"
        }
    }
})

-- Treesitter Configuration
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "python",
        "typescript",
        "html",
        "css"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true }
})

-- null-ls Configuration
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.flake8,
    },
})

-- Gitsigns Configuration
require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})

-- NvimTree Configuration
require('nvim-tree').setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

-- Toggleterm Configuration
require('toggleterm').setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    direction = 'float',
})

-- Lualine Configuration
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
})

-- Tokyo Night Theme Configuration
require('tokyonight').setup({
    style = "storm",
    transparent = false,
    terminal_colors = true,
})

-- Set colorscheme
vim.cmd[[colorscheme tokyonight]]

-- Kerboscript Configuration
--require('kerbovim').setup({})
