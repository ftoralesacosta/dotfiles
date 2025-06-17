require('onedarker').setup({
    disable_background = true
})


function ColorMyPencils(color)
	color = color or "onedarker"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

-- Lua


-- ColorMyPencils('onedark')
-- ColorMyPencils('gruvbox')
-- ColorMyPencils('onedarker')
-- ColorMyPencils('rose-pine')
-- ColorMyPencils('everforest')


--MacOS Terminal kinda sucks
--vim.g.termguicolors=True
--vim.g.term=xterm
--vim.g.t_Co=256
--vim.g.background=light

  vim.opt.termguicolors = false
  vim.o.termguicolors = true                                                         vim.g.termguicolors= false
