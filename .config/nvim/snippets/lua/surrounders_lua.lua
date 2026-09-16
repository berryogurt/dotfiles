---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

return {
	s(
		{
			trig = '"',
			trigEngine = "plain",
			name = "Quotes",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			priority = 1000,
		},
		fmta(
			[[
        "<>"
      ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "'",
			trigEngine = "plain",
			name = "Apostrophes",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			priority = 1000,
		},
		fmta(
			[[
        '<>'
      ]],
			{
				i(1),
			}
		)
	),
}
