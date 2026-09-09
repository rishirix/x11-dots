vim.cmd.set(
	'number',
	'relativenumber',
	'termguicolors',
	'clipboard+=unnamedplus',
	'noshowmode'
)
vim.g.mapleader = " "
vim.g.airline_theme = 'base16'
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install{ "c","cpp","java","javascript","python","lua","rust" }
local builtin = require("telescope.builtin")
require("colorizer").setup()

vim.keymap.set('n','<leader>pv', vim.cmd.Ex)
vim.keymap.set('n','<leader>ff',builtin.find_files,{})
vim.keymap.set('n','<leader>fg',builtin.live_grep,{})
vim.keymap.set('n','<C-n>',':Neotree toggle <CR>',{})
vim.cmd.colorscheme "industry"

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
