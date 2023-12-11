require("options")
require('plugins')
require('keymaps')

-- カラースキーマ
vim.cmd[[colorscheme tokyonight-night]]

-- IME
require('im_select').setup {
    default_im_select = "com.apple.keylayout.ABC"
}
