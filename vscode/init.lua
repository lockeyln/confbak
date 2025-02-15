if vim.g.vscode then
    vim.g.mapleader = " "
    vim.o.clipboard = "unnamedplus"
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.foldmethod = "manual"
    vim.o.cursorline = true
    -- 禁用Neovim的文件管理
    vim.g.loaded_newrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- 设置快捷键
    vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
end
