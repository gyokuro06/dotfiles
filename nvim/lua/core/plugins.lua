

-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	-- カラースキーマ
	use 'folke/tokyonight.nvim'

	-- IME
	use 'keaising/im-select.nvim'
end)