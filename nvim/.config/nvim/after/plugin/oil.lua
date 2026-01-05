require("oil").setup({
  keymaps = {
    ["<C-h>"] = false
  },
  columns = {
    "icon",
    "permissions"
  },
  view_options = {
    show_hidden = true,
  }
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
