-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = {'dashboard'},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
	system_open = {
			-- the command to run this, leaving nil should work in most cases
			cmd = nil,
			-- the command arguments as a list
			args = {}
	},
	view = {
		width = 30,
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = false,
		}
	},
	actions = {
		open_file = {
				resize_window = true
		}
	}
}

vim.keymap.set("n", "<leader>o", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")