require('vgit').setup({
  keymaps = {
    ['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
    ['n <leader>gf'] = function() require('vgit').buffer_diff_preview() end,
    ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
    ['n <C-P>'] = function() require('vgit').hunk_up() end,
    ['n <C-N>'] = function() require('vgit').hunk_down() end,
    ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
    ['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
    ['n <leader>gl'] = function() require('vgit').project_logs_preview() end,
  }
})
