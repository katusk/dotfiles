-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { silent = true }) -- Exiting Insert mode: <M-j> jj jk kj fd ;; ,,
vim.keymap.set("n", "<CR>", ":", { silent = true }) -- A bit more convenient access to Ex commands
