---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

-- Math zone context
-- taken from https://ejmastnak.com/

local not_in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s(
		{
			trig = "\\{",
			name = "Visible Braces",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
          \{<>\}<>
        ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		{
			trig = "|",
			name = "Absolute value",
			wordTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 1000,
		},
		fmta(
			[[
    |<>|<>
    ]],
			{ i(1), i(0) }
		),
		{}
	),
	s(
		{
			trig = "lr|",
			name = "Left Right Absolute Value",
			snippetType = "autosnippet",
			priority = 9999,
		},
		fmta(
			[[
    \left| <> \right| <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "lr(",
			name = "Left Right Parentheses",
			snippetType = "autosnippet",
			priority = 9999,
		},
		fmta(
			[[
    \left( <> \right) <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "lr[",
			name = "Left Right Square Brackets",
			snippetType = "autosnippet",
			priority = 9999,
		},
		fmta(
			[[
    \left[ <> \right] <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "lr{",
			name = "Left Right Braces",
			snippetType = "autosnippet",
			priority = 9999,
		},
		fmta(
			[[
    \left\{ <> \right\} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "norm",
			name = "Norm",
			snippetType = "autosnippet",
		},
		fmta(
			[[
  \left\| <> \right\|_{<>}
  ]],
			{ i(1), i(2) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "lr<",
			name = "Left Right Angled Bracket",
			snippetType = "autosnippet",
		},
		fmta(
			[[
    \langle <> \rangle <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
}
