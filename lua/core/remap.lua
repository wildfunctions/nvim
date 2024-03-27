vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>rn", "<cmd>lua RenameSymbol()<CR>", {noremap = true, silent = true})
function RenameSymbol()
    vim.lsp.buf.rename()
end
