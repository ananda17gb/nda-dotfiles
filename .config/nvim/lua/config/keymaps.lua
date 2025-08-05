-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- NdaAW's stuff
-- Go to snacks.dashboard
map("n", "<leader>dd", function()
  require("snacks.dashboard").open()
end, { desc = "Open Dashboard" })

-- Flutter dev stuff
-- Flutter Run
map("n", "<leader>Ff", ":FlutterRun<CR>", { noremap = true, silent = true })
-- Flutter Debug
map("n", "<leader>FD", ":FlutterDebug<CR>", { noremap = true, silent = true })
-- Flutter Devices
map("n", "<leader>Fd", ":FlutterDevices<CR>", { noremap = true, silent = true })
-- Flutter Emulators
map("n", "<leader>Fe", ":FlutterEmulators<CR>", { noremap = true, silent = true })
-- Flutter Hot Reload
map("n", "<leader>Fr", ":FlutterReload<CR>", { noremap = true, silent = true })
-- Flutter Restart
map("n", "<leader>FR", ":FlutterRestart<CR>", { noremap = true, silent = true })
-- Flutter Quit
map("n", "<leader>Fq", ":FlutterQuit<CR>", { noremap = true, silent = true })

-- Moving buffer on bufferline.nvim
map("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
map("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- -- Transparent Background toggle
-- -- Function to toggle background transparency
-- function _G.toggle_transparency()
--   if vim.g.transparent_background == true then
--     -- Make background opaque
--     vim.cmd([[
--       highlight Normal guibg=#282828
--       highlight NonText guibg=#282828
--       highlight Normal ctermbg=234
--       highlight NonText ctermbg=234
--     ]])
--     vim.g.transparent_background = false
--     print("Background: Opaque")
--   else
--     -- Make background transparent
--     vim.cmd([[
--       highlight Normal guibg=none
--       highlight NonText guibg=none
--       highlight Normal ctermbg=none
--       highlight NonText ctermbg=none
--     ]])
--     vim.g.transparent_background = true
--     print("Background: Transparent")
--   end
-- end
--
-- -- Set initial state
-- vim.g.transparent_background = false
--
-- -- Create a keymap to toggle transparency
-- -- Here I'm using <leader>tt but you can change to your preference
-- vim.api.nvim_set_keymap("n", "<leader>ut", ":lua toggle_transparency()<CR>", { noremap = true, silent = true })
