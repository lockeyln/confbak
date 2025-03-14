-- leader键
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 设置option
vim.o.clipboard = "unnamedplus"
vim.o.foldmethod = "manual"
vim.o.hlsearch = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undodir = vim.fn.stdpath("data")
-- 禁用Neovim的文件管理
vim.g.loaded_newrw = 1
vim.g.loaded_netrwPlugin = 1

-- 大写 J 和 K 跳转5行
vim.keymap.set('n', 'J', '5j')
vim.keymap.set('n', 'K', '5k')
-- 大写 H 和 L 行首和行尾
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
-- 反向撤销
vim.keymap.set('n', 'U', '<C-r>')
-- 清除高亮
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
