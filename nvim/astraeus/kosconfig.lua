local kos = require('astraeus.kos')

vim.api.nvim_create_user_command('OpenKOSTelnet', function(opts)
  kos.open_kos_telnet(opts.args)
end, { nargs = '*' })

vim.api.nvim_create_user_command('ToggleKOSTelnet', function(opts)
  kos.open_kos_telnet(opts.args)
end, { nargs = '*' })
