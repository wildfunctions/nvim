local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>r", mark.rm_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>n", ui.nav_next)
vim.keymap.set("n", "<leader>p", ui.nav_prev)
