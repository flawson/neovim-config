-- ======================================================
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- ======================================================

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

vim.keymap.set("n", "<leader>fe", vim.cmd.Neotree, { desc = "Open [F]ile [E]xplorer" })
vim.keymap.set("n", "<leader>t", vim.cmd("botright split | resize 12 | terminal"), { desc = "Open [T]erminal" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Split window keymaps
vim.keymap.set("n", "<leader>wv", "<C-w><C-v>", { desc = "Open split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w><C-s>", { desc = "Open split window horizontally" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>wH", "<C-w><C-H>", { desc = "Move window to the left" })
vim.keymap.set("n", "<leader>wL", "<C-w><C-L>", { desc = "Move window to the right" })
vim.keymap.set("n", "<leader>wJ", "<C-w><C-J>", { desc = "Move window down" })
vim.keymap.set("n", "<leader>wK", "<C-w><C-K>", { desc = "Move window up" })

vim.keymap.set("n", "<leader>pp", vim.cmd.Tabnew, { desc = "New tabpage" })
vim.keymap.set("n", "<leader>ph", vim.cmd.Tabnew, { desc = "Previous tabpage" })
vim.keymap.set("n", "<leader>pl", vim.cmd.Tabnew, { desc = "Next tabpage" })
vim.keymap.set("n", "<leader>pH", vim.cmd.Tabnew, { desc = "Move tabpage left" })
vim.keymap.set("n", "<leader>pL", vim.cmd.Tabnew, { desc = "Move tabpage right" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
