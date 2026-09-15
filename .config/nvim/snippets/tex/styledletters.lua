---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	-- Super and subscript schortcuts
	s({
		trig = "(%a)(%d)",
		name = "Letter Subscripts",
		regTrig = true,
		wordTrig = false,
		snippetType = "autosnippet",
		priority = 1000,
	}, {
		f(function(_, snip)
			return snip.captures[1]
		end),
		t("_"),
		f(function(_, snip)
			return snip.captures[2]
		end),
		t(" "),
	}, { condition = in_mathzone }),
	-- Real numbers shortcuts to the n
	s({
		trig = "RR",
		name = "Real Numbers",
		snippetType = "autosnippet",
		condition = in_mathzone,
	}, fmta([[\mathbb R]], {})),
	s(
		{
			trig = "R([nmk%d])",
			name = "Mathbb R",
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \mathbb R^<> 
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	-- Calligraphy, Bold , Blackboard font etc.
	s(
		{ trig = "mathfrak", name = "Math Fraktur", snippetType = "snippet" },
		fmta(
			[[
    \mathfrak{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "mathscr", name = "Math Script", snippetType = "snippet" },
		fmta(
			[[
    \mathscr{<>} 
    ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	-- s(
	--   { trig = "(%a)bb", name = "Blackboard Math", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	--   { t("\\mathbb "), f(function(_, snip)
	--     return snip.captures[1]
	--   end), t(" ") },
	--   { condition = in_mathzone }
	-- ),
	s(
		{
			trig = "QQ",
			name = "Rational Numbers",
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \mathbb Q
    ]],
			{}
		)
	),
	s(
		{
			trig = "NN",
			name = "Natural Numbers",
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \mathbb N
    ]],
			{}
		)
	),
	s(
		{
			trig = "PP",
			name = "Probability Space",
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \mathbb P
    ]],
			{}
		)
	),
	s(
		{
			trig = "(%a)cal",
			name = "Calligraphy Math",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \mathcal{<>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "CC(.)",
			name = "Mathcal C",
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \mathcal{C}<>
    ]],
			{
				d(1, function(_, snip)
					local input = snip.captures[1]
					if input == "(" then
						return sn(nil, { t("("), i(1), t(") ") })
					elseif input == "o" then
						return sn(nil, t("^" .. input))
					elseif string.find("1234567890mnk", input) then
						--if type(tonumber(input)) == "number" then
						return sn(nil, t("^" .. input .. " "))
					else
						return sn(nil, t(input))
					end
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)bf",
			name = "Math Bold Font",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \mathbf{<>} 
        ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)dtil",
			name = "Math Tilde Letter with Dot",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
      \dot{\tilde{<>}} 
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)dbf",
			name = "Math Bold Letter with Dot",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
      \dot{\mathbf{<>}} 
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)dba",
			name = "Math Bar Letter with Dot",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
      \dot{\bar{<>}} 
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)dbf",
			name = "Math Bold Letter with Dot",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
      \dot{\mathbf{<>}} 
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	-- Variable markings, hat, tilde, bar, etc
	s(
		{
			trig = "bar(%a)",
			name = "Bar",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \bar{<><>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{
			trig = "(%a)bar",
			name = "Bar",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \bar{<>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "til(%a)",
			name = "Tilde",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \tilde{<><>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{
			trig = "(%a)til",
			name = "Tilde",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \til{<>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)hat",
			name = "(trig)Hat",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \hat{<>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "hat(%a)",
			name = "Hat(trig)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \hat{<><>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{
			trig = "dot(%a)",
			name = "Dot (right)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \dot{<><>} 
  ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{
			trig = "(%a)dot",
			name = "Dot",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
        \dot{<>}
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "(%a)ddot",
			name = "Double Dot",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
        \ddot{<>}
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
}
