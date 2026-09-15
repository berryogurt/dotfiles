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
	-- LaTeX environments
	s(
		{
			trig = "([%a%$%}%]%)]) ([%-%.%,%:%?%!])",
			name = "Autofix after delimiters and $",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
          <><>
        ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				f(function(_, snip)
					return snip.captures[2]
				end),
			}
		)
	),
	s(
		{
			trig = "tii(.)",
			name = "Italics Font",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				if current.name == "\\textit" or in_mathzone() then
					return false
				end
				return true
			end,
			priority = 9999,
		},
		fmta(
			[[
    \textit{<>}
    ]],
			{
				d(1, function(_, snip)
					local input = snip.captures[1]
					if input == "(" then
						return sn(nil, { t("("), i(1), t(")") })
					else
						return sn(nil, { t(input), i(1) })
					end
				end),
			}
		)
	),
	s(
		{
			trig = "tbb(.)",
			name = "Bold Font",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				if current.name == "\\textbf" or in_mathzone() then
					return false
				end
				return true
			end,
			priority = 9999,
		},
		fmta(
			[[
    \textbf{<>} 
    ]],
			{
				d(1, function(_, snip)
					local input = snip.captures[1]
					if input == "(" then
						return sn(nil, { t("("), i(1), t(")") })
					else
						return sn(nil, { t(input), i(1) })
					end
				end),
			}
		)
	),
	s(
		{
			trig = "emph",
			name = "Emphasize",
			snippetType = "snippet",
		},
		fmta(
			[[
    \emph{<>} 
    ]],
			{
				i(1),
			}
		),
		{ condition = not_in_mathzone }
	),
	s(
		{
			trig = "begin",
			name = "Begin Environment",
			snippetType = "snippet",
		},
		fmta(
			[[
    \begin{<>}
      <>
    \end{<>}
    ]],
			{
				i(1),
				i(0),
				rep(1),
			}
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "enumerateabc", name = "Enumerate (alphanumeric)", snippetType = "snippet" },
		fmta(
			[[
    \begin{enumerate}[label=\alph*)]
      \item <>
    \end{enumerate}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "enumrerateroman", name = "Enumerate (roman)", snippetType = "snippet" },
		fmta(
			[[
    \begin{enumerate}[label=\roman*)]
      \item <>
    \end{enumerate}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{
			trig = "enumerate123",
			name = "Enumerate (123)",
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
    \begin{enumerate}[label=\arabic*<>]
      \item <>
    \end{enumerate}
    ]],
			{ i(1, "."), i(0) }
		)
	),
	s(
		{
			trig = "itemize",
			name = "Itemize Environment",
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
    \begin{itemize}[label = <>]
      \item <>
    \end{itemize}
    ]],
			{ i(1, "$\\bullet$"), i(0) }
		)
	),
	-- Math Theorems
	s(
		{ trig = "definition", name = "Definition", snippetType = "snippet" },
		fmta(
			[[
    \begin{definition}
      <>
    \end{definition}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "example", name = "Example", snippetType = "snippet" },
		fmta(
			[[
    \begin{example}
      <>
    \end{example}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "lemma", name = "Lemma", snippetType = "snippet" },
		fmta(
			[[
    \begin{lemma}
      <>
    \end{lemma}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "theorem", name = "Theorem", snippetType = "snippet" },
		fmta(
			[[
    \begin{theorem}
      <>
    \end{theorem}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "proof", name = "Proof", snippetType = "snippet" },
		fmta(
			[[
    \begin{proof}
      <>
    \end{proof}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "corollary", name = "Corollary", snippetType = "snippet" },
		fmta(
			[[
    \begin{corollary}
      <>
    \end{corollary}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "proposition", name = "Proposition", snippetType = "snippet" },
		fmta(
			[[
    \begin{proposition}
      <>
    \end{proposition}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "remark", name = "Remark", snippetType = "snippet" },
		fmta(
			[[
    \begin{remark}
      <>
    \end{remark}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{
			trig = "recall",
			name = "Recall",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
          \begin{recall}
            <>
          \end{recall}
        ]],
			{
				i(0),
			}
		)
	),
	s(
		{ trig = "homework", name = "Homework", snippetType = "snippet" },
		fmta(
			[[
    \begin{homework}
      <>
    \end{homework}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{
			trig = "hypothesis",
			name = "Hypothesis",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
          \begin{hypothesis}
            <>
          \end{hypothesis}
        ]],
			{
				i(0),
			}
		)
	),
	s(
		{ trig = "note", name = "Note", snippetType = "snippet" },
		fmta(
			[[
    \begin{note}
      <>
    \end{note}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "chapter", name = "Chapter", snippetType = "snippet" },
		fmta(
			[[
    \chapter{<>}<>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "section", name = "Section", snippetType = "snippet" },
		fmta(
			[[
    \section{<>}<>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "subsection", name = "Subsection", snippetType = "snippet" },
		fmta(
			[[
    \subsection{<>}<>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "subsubsection", name = "Subsubsection", snippetType = "snippet" },
		fmta(
			[[
    \subsubsection{<>}<>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "section*", name = "Section*", snippetType = "snippet" },
		fmta(
			[[
    \section*{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "subsection*", name = "Subsection*", snippetType = "snippet" },
		fmta(
			[[
    \subsection*{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "subsubsection*", name = "Subsubsection*", snippetType = "snippet" },
		fmta(
			[[
    \subsubsection*{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s({
		trig = "item",
		name = "Item",
		snippetType = "snippet",
		wordTrig = false,
	}, {
		t({ "", "\\item " }),
	}),
	s(
		{
			trig = "figure",
			name = "Single Figure",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
\begin{figure}[<>]
  \centering
  \includegraphics[width=<>\textwidth]{images/<>}
  \caption{<>}
  \label{fig:<>}
\end{figure}

        ]],
			{
				i(1, "htpb"),
				i(2, "0.8"),
				i(3, "image.png"),
				i(4, "caption"),
				i(5, "label"),
			}
		)
	),
	s(
		{
			trig = "subfigure",
			name = "Sub Figure",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
  \begin{figure}[<>] %htbp
    \centering
    \begin{subfigure}{<>\textwidth}
        \centering
        \includegraphics[width=\textwidth]{images/<>}
        %<>
        <>
        %<>
        <>
    \end{subfigure}
    %<>
    <>
    \begin{subfigure}{<>\textwidth}
        \centering
        \includegraphics[width=\textwidth]{images/<>}
        %<>
        <>
        %<>
        <>
    \end{subfigure}
    %<>
    <>
    %<>
    <>
  \end{figure}
    <>
    ]],
			{
				i(1, "t"),
				i(2, "0.45"),
				i(3, "image.png"),
				i(4, "no caption"),
				f(function(args)
					local caption = args[1][1]
					if caption == "no caption" then
						return "%"
					else
						return "\\caption{" .. caption .. "}"
					end
				end, { 4 }),
				i(5, "no label"),
				f(function(args)
					local label = args[1][1]
					if label == "no label" then
						return "%"
					else
						return "\\label{fig:" .. label .. "}"
					end
				end, { 5 }),
				i(6, "\\hfill"),
				f(function(args)
					local arg = args[1][1]
					if arg == "\\hfill" then
						return "\\hfill"
					else
						return "%"
					end
				end, { 6 }),
				i(7, "0.45"),
				i(8, "image.png"),
				i(9, "no caption"),
				f(function(args)
					local caption = args[1][1]
					if caption == "no caption" then
						return "%"
					else
						return "\\caption{" .. caption .. "}"
					end
				end, { 9 }),
				i(10, "no label"),
				f(function(args)
					local label = args[1][1]
					if label == "no label" then
						return "%"
					else
						return "\\label{fig:" .. label .. "}"
					end
				end, { 10 }),
				i(11, "no caption"),
				f(function(args)
					local caption = args[1][1]
					if caption == "no caption" then
						return "%"
					else
						return "\\caption{" .. caption .. "}"
					end
				end, { 11 }),
				i(12, "no label"),
				f(function(args)
					local label = args[1][1]
					if label == "no label" then
						return "%"
					else
						return "\\label{fig:" .. label .. "}"
					end
				end, { 12 }),
				i(0),
			}
		)
	),
	--
	--
	--
	--
	--
	--
	--
	--
	--
	-- Math Normal Environments
	--
	s(
		{ trig = "mm", name = "Inline Math", snippetType = "autosnippet", condition = not_in_mathzone },
		fmta(
			[[
      $<>$ <>
      ]],
			{ i(1), i(0) }
		)
	),
	s(
		{
			trig = "\\[",
			name = "Unlabeled Equation",
			snippetType = "autosnippet",
			priority = 9999,
		},
		fmta(
			[[
    \[
      <>
    \]
    ]],
			{ i(0) }
		)
	),
	s(
		{ trig = ";e", name = "Equation Environment", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \begin{equation}
      <>
    \end{equation}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = ";le", name = "Labeled Equation", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \begin{equation}\label{eq:<>}
      <>
    \end{equation}
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "align", name = "Align", snippetType = "snippet" },
		fmta(
			[[
    \begin{align}
      <>
    \end{align}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = ";a", name = "Align*", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \begin{align*}
      <>
    \end{align*}
    ]],
			{ i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = ";la", name = "Labeled Align", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
    \begin{align}\label{eq:<>}
      <>
    \end{align}
    ]],
			{ i(1), i(0) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "label", name = "Label", snippetType = "autosnippet" },
		fmta(
			[[
  \label{<>} <>
  ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "ref", name = "Reference", snippetType = "snippet" },
		fmta(
			[[
  \ref{<>} 
  ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "eqref", name = "Equation Reference", snippetType = "autosnippet" },
		fmta(
			[[
  \eqref{<>} 
  ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "underline", name = "Underline", snippetType = "snippet" },
		fmta(
			[[
    \underline{<>} 
    ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "overline", name = "Overline", snippetType = "snippet" },
		fmta(
			[[
    \overline{<>} 
    ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "cite", name = "Cite", snippetType = "snippet" },
		fmta(
			[[
    \cite[<>]{<>}
    ]],
			{ i(1, "page info"), i(2, "bibtex id") },
			{ condition = not_in_mathzone }
		)
	),
	s(
		{ trig = "noindent", name = "No Indent", snippetType = "snippet" },
		fmta(
			[[
    \noindent 
    ]],
			{}
		),
		{ condition = not_in_mathzone }
	),
	s(
		{ trig = "alert", name = "Alert Text", snippetType = "snippet" },
		fmta(
			[[
    \alert{<>} 
    ]],
			{ i(1) }
		),
		{ condition = not_in_mathzone }
	),
	s(
		{
			trig = "numcases",
			name = "Numbered Cases",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
      \begin{numcases}
        {}
        <>
      \end{numcases}
        ]],
			{
				i(0, "cases contents here below {}"),
			}
		)
	),
	s(
		{
			trig = "subnumcases",
			name = "Sub-Numbered Cases",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
      \begin{subnumcases}
        {}
        <>
      \end{subnumcases}
        ]],
			{
				i(0, "cases contents here below {}"),
			}
		)
	),
	s(
		{
			trig = "center",
			name = "Center",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
      \begin{center}
        <>
      \end{center}
        ]],
			{
				i(0),
			}
		)
	),
	s(
		{
			trig = "verbatim",
			name = "Verbatim Code Environment",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
      \begin{verbatim}
        <>
      \end{verbatim}
        ]],
			{
				i(0),
			}
		)
	),
	s(
		{
			trig = "root",
			name = "TeX Root Declaration",
			snippetType = "snippet",
		},
		fmta(
			[[
          % !TeX root = ../*.tex

        ]],
			{}
		)
	),
	s(
		{
			trig = "includegraphics",
			name = "Centered Graphics",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
          \begin{center}
            \includegraphics[width = <>]{images/<>}
          \end{center}
        ]],
			{
				i(1, "\\textwidth"),
				i(2),
			}
		)
	),
	s(
		{
			trig = "lecture",
			name = "Lecture Mark",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
      \begin{center}
      \rule[3pt]{3cm}{0.5px} \quad  Lecture <> \quad \rule[3pt]{3cm}{0.5pt}
      \end{center}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "lectureheader",
			name = "Lecture Mark in Header",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = not_in_mathzone,
		},
		fmta(
			[[
          \fancyhead[C]{\rule[3pt]{3cm}{0.5px} \quad  Lecture <>  \quad \rule[3pt]{3cm}{0.5pt}}
        ]],
			{
				i(1),
			}
		)
	),
}
