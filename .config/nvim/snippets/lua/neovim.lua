---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

return {
	s(
		{ trig = "snippet", name = "Snippet", snippetType = "snippet" },
		fmta(
			[=[
s(
{
trig = "<>",
name = "<>",
wordTrig = <>,
regTrig = <>,
snippetType = "<>snippet",
condition = <>in_mathzone
},
fmta(
[[
<>
]],
{
<>
}
)
),
]=],
			{
				i(1, "trigger"),
				i(2, "name"),
				c(3, { t("true"), t("false") }),
				c(4, { t("false"), t("true") }),
				c(5, { t("auto"), t("") }),
				c(6, { t(""), t("not_") }),
				i(7, "snippet"),
				c(8, { t(""), t("i(0)") }),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		{
			trig = "keymap",
			name = "Set New Keymap",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
		},
		fmta(
			[[
vim.keymap.set( "<>" , "<>", "<>" , { desc = "<>" }) -- <>
        ]],
			{
				i(1, "nisv"),
				i(2, "trigger"),
				i(3, "keymap action"),
				i(4, "description"),
				i(5, "comment for config"),
			}
		)
	),
}
