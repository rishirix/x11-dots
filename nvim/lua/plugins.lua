return {
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{"nvim-telescope/telescope.nvim", version = "*",
	dependencies = {"nvim-lua/plenary.nvim"}},
	{"nvim-treesitter/nvim-treesitter",lazy = false, build=":TSUpdate"},
	{"nvim-neo-tree/neo-tree.nvim",branch="v3.x",
	dependencies={"nvim-lua/plenary.nvim","MunifTanjim/nui.nvim","nvim-tree/nvim-web-devicons",},lazy=false,},
	{"windwp/nvim-autopairs",event="InsertEnter",config="true"},
	{"joshdick/onedark.vim"},
	{"vim-airline/vim-airline"},
	{"vim-airline/vim-airline-themes"},
	{"nyoom-engineering/oxocarbon.nvim"},
	{"RRethy/base16-nvim"}
}
