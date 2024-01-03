-- lang
-- vim.cmd('language en_US.utf8') -- 表示言語を英語にする (Linux)
vim.cmd('language en_US') -- 表示言語を英語にする (Mac)

-- ファイル
vim.opt.fileencoding = 'utf-8'
vim.opt.swapfile = false
vim.opt.hidden = true

-- カーソルと表示
-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- クリップボード共有
vim.opt.clipboard:append({ "unnamedplus" })

-- メニューとコマンド
vim.opt.wildmenu = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true

-- 検索・置換
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1

-- カラースキーム
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- インデント
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 表示
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.showtabline = 2
vim.opt.visualbell = true
vim.opt.showmatch = true

-- インターフェース
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'

-- 行番号の色
vim.cmd('highlight LineNr guifg=#8a70ac')

-- カーソルの形状
vim.o.guirsor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
