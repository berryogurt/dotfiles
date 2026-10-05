---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

return {
	s(
		{
			trig = "<",
			trigEngine = "plain",
			name = "Angle Bracket",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			priority = 1000,
		},
		fmt("<{}>", {
			i(1),
		})
	),
}
