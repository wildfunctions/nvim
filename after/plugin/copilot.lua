vim.keymap.set("n", "<leader>ce", function() vim.cmd('Copilot enable'); print("Copilot enabled") end, { noremap = true})
vim.keymap.set("n", "<leader>cd", function() vim.cmd('Copilot disable'); print("Copilot disabled") end, { noremap = true})
