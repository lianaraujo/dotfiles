local orgmode = require('orgmode')
orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = { '~/docs/procs/metrobi/*.org' },
  org_default_notes_file = '~/docs/procs/metrobi/notas.org'
})
