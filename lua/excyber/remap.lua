
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- >> move fast with crtl move
vim.keymap.set("n", '<C-h>', "b",    {noremap = true, silent = true}) 
vim.keymap.set("n", '<C-l>', "w",    {noremap = true, silent = true}) 

vim.keymap.set("n", '<C-Left>', "b",{noremap = true, silent = true})  
vim.keymap.set("n", '<C-Right>',  "w",{noremap = true, silent = true})  

vim.keymap.set('n', '<C-j>', "}",{noremap = true, silent = true})
vim.keymap.set('n', '<C-k>', "{",{noremap = true, silent = true})

vim.keymap.set('n', '<C-Up>', "{",{noremap = true, silent = true})
vim.keymap.set('n', '<C-Down>', "}",{noremap = true, silent = true})


vim.keymap.set("i", '<C-Up>', 
  function ()
    print("hello")
    vim.call("spellbadword")
  end, 

  {noremap = true, silent = true}
)
-- << move fast with crtl move

-- >> Shift Selection :
vim.keymap.set('n', '<S-Up>', "v<Up>",{noremap = true, silent = true})
vim.keymap.set('n', '<S-Down>', "v<Down>",{noremap = true, silent = true})

vim.keymap.set('n', '<S-Left>', "v",{noremap = true, silent = true})
vim.keymap.set('n', '<S-Right>', "v",{noremap = true, silent = true})

vim.keymap.set('i', '<S-Up>', "<C-o>v<Up>",{noremap = true, silent = true})
vim.keymap.set('i', '<S-Down>', "<C-o>v<Down>",{noremap = true, silent = true})

vim.keymap.set('i', '<S-Left>', "<C-o>v<Left>",{noremap = true, silent = true})
vim.keymap.set('i', '<S-Right>', "<C-o>v<Right>",{noremap = true, silent = true})

vim.keymap.set('v', 'i', "<ESC><ESC>",{noremap = true, silent = true})
vim.keymap.set('v', '<S-Up>', "<Up>",{noremap = true, silent = true})
vim.keymap.set('v', '<S-Down>', "<Down>",{noremap = true, silent = true})

vim.keymap.set('v', '<S-Left>', "<Left>",{noremap = true, silent = true})
vim.keymap.set('v', '<S-Right>', "<Right>",{noremap = true, silent = true})
-- << Shift Selection :

-- >> Set back and forth in code to be Alt keys
vim.keymap.set('n', '<M-Left>', "<C-o>",{noremap = true, silent = true})
vim.keymap.set('n', '<M-Right>', "<C-i>",{noremap = true, silent = true})
-- << Shift Selection :
-- <<

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader><leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-s>", ":/")

vim.keymap.set("n", '<M-Up>', "ddkP") --// Moving the line up
vim.keymap.set("n", '<M-Down>', "ddjP") -- // Moving the line down


vim.keymap.set("i", '<C-s>', "<C-c>:w<CR>li") -- saving with crt + s on insert mode 
vim.keymap.set("n", '<C-s>', ":w<CR>") -- saving with crt + s on insert mode 

vim.keymap.set("v", '<M-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set("v", '<M-Down', ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+P")

-- Maybe the same button for entering in both modes ??
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)