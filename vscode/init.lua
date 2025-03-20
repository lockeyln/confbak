-----------------
--  options  --
-----------------
-- Hint: use `:h <option>` to figure out the meaning if needed
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

vim.o.clipboard = 'unnamedplus' -- use system clipboard
vim.o.mouse = 'a' -- allow the mouse to be used in Nvim

vim.g.encoding = "utf-8" -- Just in case
vim.o.fileencoding = "utf-8" -- Just in case

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- Searching
vim.o.incsearch = true -- search as characters are entered
vim.o.hlsearch = true -- do not highlight matches
vim.o.ignorecase = true -- ignore case in searches by default
vim.o.smartcase = true -- but make it case sensitive if an uppercase is entered

-- UI config
vim.o.number = true -- show absolute number
vim.o.relativenumber = true -- add numbers to each line on the left side
vim.o.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.o.splitbelow = true -- open new vertical split bottom
vim.o.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.o.showmode = true -- we are experienced, wo don't need the "-- INSERT --" mode hint

vim.o.wrap = false -- Wrapping sucks (except on markdown)
vim.o.swapfile = false -- Do not leave any backup files
vim.o.showmatch = true -- Highlights the matching parenthesis
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text
vim.o.hidden = true -- Allow multple buffers
vim.o.cmdheight = 2 -- Shows better messages

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

-- 禁用Neovim的文件管理
vim.g.loaded_newrw = 1
vim.g.loaded_netrwPlugin = 1

-----------------
--  keymaps  --
-----------------
-- define common options
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

-- 将 leader 键重新映射
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 大写 J 和 K 跳转5行
keymap('n', 'J', '5j')
keymap('n', 'K', '5k')
-- 大写 H 和 L 行首和行尾
keymap('n', 'H', '^', opts)
keymap('n', 'L', '$', opts)
-- 清除高亮
keymap('n', '<Esc>', ':nohlsearch<CR>')

-- vscode 专用设置
if vim.g.vscode then
    -- VSCode extension
    -- VSCode 下的 NeoVim 设置
else
    -- ordinary Neovim
    -- Nvim环境下的设置 
end
