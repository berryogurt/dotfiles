if vim.g.colors_name == "everforest" then
	local orange = "#e69875"
	local blue = "#7fbbb3"
	local yellow = "#dbbc7f"
	local red = "#e67e80"
	local aqua = "#83c092"
	local purple = "#d699b6"
	local green = "#a2c080"
	local lightgrey = "#9da9a0"
	-- local darkgrey = "#7a8478"
	local grey = "#859289"

	vim.api.nvim_set_hl(0, "texCmdEnv", { fg = lightgrey })
	vim.api.nvim_set_hl(0, "texEnvArgName", { fg = yellow, italic = true }) -- \begin{ARGNAME}
	vim.api.nvim_set_hl(0, "texMathEnvArgName", { fg = yellow, italic = true }) -- \begin{ARGNAME} (math)
	vim.api.nvim_set_hl(0, "texOpt", { fg = aqua })
	vim.api.nvim_set_hl(0, "texCmdPart", { fg = lightgrey })
	vim.api.nvim_set_hl(0, "texPartArgTitle", { fg = yellow, italic = true })
	vim.api.nvim_set_hl(0, "texDelim", { fg = red })
	vim.api.nvim_set_hl(0, "texCmd", { fg = lightgrey })
	vim.api.nvim_set_hl(0, "texRefArg", { fg = purple })
	vim.api.nvim_set_hl(0, "texMathZone", { fg = blue }) -- blue
	vim.api.nvim_set_hl(0, "Conceal", { fg = blue }) -- blue
	vim.api.nvim_set_hl(0, "texCmdGreek", { fg = blue })
	vim.api.nvim_set_hl(0, "texMathCmd", { fg = green }) -- \cos \sin etc
	vim.api.nvim_set_hl(0, "texMathDelim", { fg = orange })
	vim.api.nvim_set_hl(0, "texMathSuperSub", { fg = orange })
	vim.api.nvim_set_hl(0, "texMathOper", { fg = green })
	vim.api.nvim_set_hl(0, "texMathSymbol", { fg = green })
	vim.api.nvim_set_hl(0, "texSpecialChar", { fg = orange }) -- \\ and others
	vim.api.nvim_set_hl(0, "SpecialChar", { fg = red }) -- & \\
end
