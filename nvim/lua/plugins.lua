local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- カラースキーマ
	use 'folke/tokyonight.nvim'

	-- IME
	use 'keaising/im-select.nvim'
end)