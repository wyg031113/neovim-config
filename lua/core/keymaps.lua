vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<leader>L", ":bnext<CR>") --移动到左边标签
keymap.set("n", "<leader>H", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --打开文件导航
keymap.set("n", "<leader>w", ":TagbarToggle<CR>")

-- async
keymap.set("n", "<leader>R", ":AsyncTask ") --异步运行task
keymap.set("n", "<leader>cc", ":cclose<CR>") --关闭task运行后的quickfix窗口
keymap.set("n", "<leader>c", ":copen<CR>") --打开quickfix窗口

