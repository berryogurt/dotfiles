---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	-- Greek symbols, only in math environments:
	s(
		{ trig = "alp", name = "Alpha", snippetType = "autosnippet" },
		fmta(
			[[
    \alpha 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "bet", name = "Beta", snippetType = "autosnippet" },
		fmta(
			[[
    \beta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "gam", name = "Gamma", snippetType = "autosnippet" },
		fmta(
			[[
    \gamma 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Gam", name = "Capital Gamma", snippetType = "autosnippet" },
		fmta(
			[[
    \Gamma 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "del", name = "Delta", snippetType = "autosnippet" },
		fmta(
			[[
    \delta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Del", name = "Capital Delta", snippetType = "autosnippet" },
		fmta(
			[[
    \Delta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "nab", name = "Nabla", snippetType = "autosnippet" },
		fmta(
			[[
  \nabla 
  ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "eps", name = "Varepsilon", snippetType = "autosnippet" },
		fmta(
			[[
    \varepsilon 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "zeta", name = "Zeta", snippetType = "autosnippet" },
		fmta(
			[[
    \zeta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "eta", name = "Eta", snippetType = "autosnippet" },
		fmta(
			[[
    \eta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "vthet", name = "Var Theta", snippetType = "autosnippet" },
		fmta(
			[[
    \vartheta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "thet", name = "Theta", snippetType = "autosnippet" },
		fmta(
			[[
    \theta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Thet", name = "Capital Theta", snippetType = "autosnippet" },
		fmta(
			[[
    \Theta 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "iota", name = "Iota", snippetType = "autosnippet" },
		fmta(
			[[
    \iota 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "kap", name = "Kappa", snippetType = "autosnippet" },
		fmta(
			[[
    \kappa 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lam", name = "Lambda", snippetType = "autosnippet" },
		fmta(
			[[
    \lambda 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Lam", name = "Lambda", snippetType = "autosnippet" },
		fmta(
			[[
    \Lambda 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "mu", name = "Mu", snippetType = "autosnippet" },
		fmta(
			[[
    \mu 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "nu", name = "Nu", snippetType = "autosnippet" },
		fmta(
			[[
    \nu 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "xi", name = "Xi", snippetType = "autosnippet" },
		fmta(
			[[
    \xi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Xi", name = "Capital Xi", snippetType = "autosnippet" },
		fmta(
			[[
    \Xi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "pi", name = "Pi", snippetType = "autosnippet" },
		fmta(
			[[
    \pi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Pi", name = "Capital Pi", snippetType = "autosnippet" },
		fmta(
			[[
    \Pi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "rho", name = "Rho", snippetType = "autosnippet" },
		fmta(
			[[
    \rho 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "([^\\])sig",
			name = "Sigma",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    <>\sigma 
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{ trig = "Sig", name = "Capital Sigma", snippetType = "autosnippet" },
		fmta(
			[[
    \Sigma 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "tau", name = "Tau", snippetType = "autosnippet" },
		fmta(
			[[
    \tau 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "ups", name = "Upsilon", snippetType = "autosnippet" },
		fmta(
			[[
    \upsilon 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Ups", name = "Capital Upsilon", snippetType = "autosnippet" },
		fmta(
			[[
    \Upsilon 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Phi", name = "Capital Phi", snippetType = "autosnippet" },
		fmta(
			[[
    \Phi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "fi", name = "Normal Lowercase Phi", snippetType = "autosnippet" },
		fmta(
			[[
    \phi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "phi", name = "Varphi", snippetType = "autosnippet" },
		fmta(
			[[
    \varphi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "chi", name = "Chi", snippetType = "autosnippet" },
		fmta(
			[[
    \chi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "psi", name = "Psi", snippetType = "autosnippet" },
		fmta(
			[[
    \psi 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Psi", name = "Capital Psi", snippetType = "autosnippet" },
		fmta(
			[[
  \Psi 
  ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "varom", name = "Var Omega", snippetType = "autosnippet" },
		fmta(
			[[
    \varomega 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "om", name = "Omega", snippetType = "autosnippet" },
		fmta(
			[[
    \omega 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "Om", name = "Capital Omega", snippetType = "autosnippet" },
		fmta(
			[[
    \Omega 
    ]],
			{}
		),
		{ condition = in_mathzone }
	),
	-- end greek letters
}
