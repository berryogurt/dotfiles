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
	-- Math symbols
	s(
		{ trig = ";o", name = "Circ", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \circ 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";p", name = "Partial", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \partial 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = ";0",
			name = "Empty Set",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \emptyset 
        ]],
			{}
		)
	),
	s(
		{ trig = "seq", name = "Subset Eq", snippetType = "autosnippet" },
		fmta(
			[[
    \subseteq 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "sub", name = "Subset", snippetType = "autosnippet" },
		fmta(
			[[
    \subset 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "bcap", name = "Big Intersection", snippetType = "autosnippet" },
		fmta(
			[[
    \bigcap_{<>} 
    ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "cap", name = "Intersection", snippetType = "autosnippet" },
		fmta(
			[[
    \cap 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "sqcap",
			name = "Disjoint Intersection",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\sqcap  
        ]],
			{}
		)
	),
	s(
		{ trig = "bcup", name = "Big Union", snippetType = "autosnippet" },
		fmta(
			[[
    \bigcup_{<>} 
    ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "b|",
			name = "Big vertical bar",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\big| 
        ]],
			{}
		)
	),
	s(
		{ trig = "cup", name = "Union", snippetType = "autosnippet" },
		fmta(
			[[
\cup 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "ell", name = "Ell", snippetType = "autosnippet" },
		fmta(
			[[
    \ell 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "sqcup",
			name = "Disjoint Union",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\sqcup 
        ]],
			{}
		)
	),
	s(
		{ trig = "oo", name = "Infinity", snippetType = "autosnippet" },
		fmta(
			[[
    \infty 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "inn", name = "In Set", snippetType = "autosnippet" },
		fmta(
			[[
    \in 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = ";x",
			name = "Times",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \times 
        ]],
			{}
		)
	),
	s(
		{ trig = "iff", name = "If And Only If", snippetType = "autosnippet" },
		fmta(
			[[
    \iff 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Larrow", name = "Left Big Arrow (Implies)", snippetType = "autosnippet" },
		fmta(
			[[
    \Leftarrow 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "larrow", name = "Left Arrow (To)", snippetType = "snippet" },
		fmta(
			[[
    \leftarrow 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Rarrow", name = "Right Big Arrow ", snippetType = "snippet" },
		fmta(
			[[
    \Rightarrow 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "rarrow", name = "Right Arrow ", snippetType = "snippet" },
		fmta(
			[[
    \rightarrow 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "to", name = "To", snippetType = "autosnippet" },
		fmta(
			[[
    \to 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "mto", name = "Maps To", snippetType = "autosnippet" },
		fmta(
			[[
    \mapsto 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = ";%.",
			name = "Cdot",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cdot 
        ]],
			{}
		)
	),
	s(
		{
			trig = "embed",
			name = "Embedding",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \hookrightarrow 
        ]],
			{}
		)
	),
	s( -- Weakly to
		{ trig = "wto", name = "Right Harpoon Up", snippetType = "autosnippet" },
		fmta(
			[[
    \rightharpoonup 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "...",
			name = "Dots",
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \dots 
    ]],
			{}
		)
	),
	s(
		{ trig = "v..", name = "Vertical Dots", snippetType = "autosnippet" },
		fmta(
			[[
    \vdots 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "c..", name = "Center Dots", snippetType = "autosnippet" },
		fmta(
			[[
    \cdots 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "qq", name = "Quad", snippetType = "autosnippet" },
		fmta(
			[[
    \quad 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Loo", name = "L-infinity", snippetType = "autosnippet" },
		fmta(
			[[
    {L^\infty} 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	-- Latex Math Environments
	s(
		{ trig = "pmatrix", name = "Matrix with Parentheses", snippetType = "snippet" },
		fmta(
			[[
    \begin{pmatrix}
      <>
    \end{pmatrix}
    ]],
			{ i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "bmatrix", name = "Matrix with Brackets", snippetType = "snippet" },
		fmta(
			[[
    \begin{bmatrix}
      <>
    \end{bmatrix}
    ]],
			{ i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "split", name = "Split Environment", snippetType = "snippet" },
		fmta(
			[[
    \begin{split}
      <>
    \end{split}
    ]],
			{ i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "sbst",
			name = "Substack",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \substack{<>} 
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "supp", name = "Support", snippetType = "autosnippet" },
		fmta(
			[[
  \mathrm{supp} ( <> ) 
  ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "divg", name = "Divergence", snippetType = "autosnippet" },
		fmta(
			[[
  \divg (<>) 
  ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "forall", name = "Math For All", snippetType = "autosnippet" },
		fmta(
			[[
    \text{ for all } 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "overset",
			name = "Overset",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\overset{<>}{<>} 
    ]],
			{ i(2, "over"), i(1, "math") }
		)
	),
	s(
		{
			trig = "underset",
			name = "Underset",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\underset{<>}{<>} 
    ]],
			{ i(2, "under"), i(1, "math") }
		)
	),
	s(
		{
			trig = "tt(.)",
			name = "Text Field",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \text{<><>} 
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
			trig = "cancel",
			name = "Cancel",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "bcancel",
			name = "Cancel (backslash)",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \bcancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "xcancel",
			name = "Cancel (X)",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \xcancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "cancelto",
			name = "Cancel with arrow",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cancelto{<>}{<>}
        ]],
			{
				i(2, "to"),
				i(1, "math"),
			}
		)
	),
	s(
		{ trig = "cases", name = "Math Cases", snippetType = "autosnippet", condition = in_mathzone },
		{ t({ "\\begin{cases}", "  " }), i(0), t({ "", "\\end{cases}" }) }
	),
	s(
		{ trig = "ww", name = "Superscript", wordTrig = false, snippetType = "autosnippet" },
		{ t("^{"), i(1), t("} ", i(0)) },
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "/([%w%-%+%#])",
			name = "Auto-Subscript",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
        _<> 
      ]],
			{
				f(function(_, snip)
					if snip.captures[1] == "#" then
						return "\\#"
					else
						return snip.captures[1]
					end
				end),
			}
		)
	),
	s(
		{
			trig = "'([%w%-%+%#])",
			name = "Auto-Superscript",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
        ^<> 
      ]],
			{
				f(function(_, snip)
					if snip.captures[1] == "#" then
						return "\\#"
					else
						return snip.captures[1]
					end
				end),
			}
		)
	),
	s(
		{ trig = "ee", name = "Superscript without braces", wordTrig = false, snippetType = "autosnippet" },
		{ t("^") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "ss", name = "Subscript", wordTrig = false, snippetType = "autosnippet" },
		{ t("_{"), i(1), t("} ", i(0)) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";d(%a)", name = "Integral dx", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta(
			[[
    \:\mathrm d <>
    ]],
			{ f(function(_, snip)
				return snip.captures[1]
			end) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "ff(.)",
			name = "fraction",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
      \frac{<><>}{<>} 
      ]],
			{
				d(1, function(_, snip)
					local input = snip.captures[1]
					if input == "(" then
						return sn(nil, { t("("), i(1), t(")") })
					elseif input == "{" then
						return sn(nil, { t("\\{"), i(1), t("\\}") })
					elseif input == "[" then
						return sn(nil, { t("["), i(1), t("]") })
					else
						return sn(nil, t(input))
					end
				end),
				i(2),
				i(3),
			}
		)
	),
	s(
		{ trig = "sum", name = "Sum", snippetType = "autosnippet" },
		fmta(
			[[
    \sum_{<>}^{<>} <>
    ]],
			{ i(1), i(2), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lim", name = "Limit", snippetType = "autosnippet" },
		fmta(
			[[
    \lim_{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "supr", name = "Supremum", snippetType = "autosnippet" },
		fmta(
			[[
    \sup_{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "esup",
			name = "Essential Supremum",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \esssup_{<>} <>
    ]],
			{ i(1), i(0) }
		)
	),
	s(
		{ trig = "inf", name = "Infimum", snippetType = "autosnippet" },
		fmta(
			[[
    \inf_{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lint", name = "Lebesgue Integral", snippetType = "autosnippet" },
		fmta(
			[[
    \int_{<>} <>
    ]],
			{ i(1, "\\Omega"), i(0) }
		),
		{ condition = in_mathzone }
	),
	s({
		trig = "[^%\\%i]int",
		name = "Integral",
		wordTrig = false,
		regTrig = true,
		snippetType = "autosnippet",
		condition = in_mathzone,
	}, fmta([[<>\int_{<>}^{<>} <>]], { t(" "), i(1, "lower"), i(2, "upper"), i(0) })),
	s(
		{ trig = "ddx", name = "Derivative", snippetType = "autosnippet" },
		fmta(
			[[
    \frac{\mathrm d <> }{\mathrm d <>} 
    ]],
			{ i(1), i(2) }
		),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ppx", name = "Partial Derivative", snippetType = "autosnippet" },
		fmta(
			[[
    \frac{\partial <>}{\partial <>} <>
    ]],
			{ i(1), i(2), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "overline", name = "Overline", snippetType = "autosnippet" },
		fmta(
			[[
    \overline{<>} 
    ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "rm(%a)",
			name = "Math Remove",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				if current.name == "\\mathrm" or not_in_mathzone() then
					return false
				end
				return true
			end,
		},
		fmta(
			[[
    \mathrm{<><>} <>
    ]],
			{ f(function(_, snip)
				return snip.captures[1]
			end), i(1), i(0) }
		)
	),

	s(
		{
			trig = "underbrace",
			name = "Underbrace",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \underbrace{<>}_{<>} 
    ]],
			{ i(1, "math"), i(2, "under") }
		)
	),
	s(
		{
			trig = "overbrace",
			name = "Overbrace",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \overbrace{<>}^{<>} 
    ]],
			{ i(1, "math"), i(2, "over") }
		)
	),
}
