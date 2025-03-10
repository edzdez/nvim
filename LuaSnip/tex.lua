local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- math
  s({ trig = "frac", dscr = "Expands 'frac' into '\\frac{}{}'" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  s({ trig = "df", dscr = "Expands 'df' into a differential '\\mathrm{d}f'" }, fmta("\\mathrm{d}<>", { i(1, "f") })),

  -- misc
  s(
    { trig = "tc", dscr = "Expands 'tc' into '\\textcolor{color}{text}'" },
    fmta("\\textcolor{<>}{<>}", { i(1, "color"), i(2, "text") })
  ),
  s({ trig = "bf", dscr = "Expands 'bf' into '\\textbf{}'" }, fmta("\\textbf{<>}", { i(1) })),
  s(
    { trig = "href", dscr = "Expands 'href' into '\\href{url}{title}'" },
    fmta("\\href{<>}{<>}", {
      i(1, "url"),
      i(2, "title"),
    })
  ),
  s(
    { trig = "emph", dscr = "Expands 'emph' into '\\emph{}'" },
    fmta("\\emph{<>}", {
      i(1),
    })
  ),
  s({ trig = "section", dscr = "Exands 'section' into '\\section{}'" }, fmta("\\section{<>}", { i(1) })),
  s({ trig = "subsection", dscr = "Exands 'subsection' into '\\subsection{}'" }, fmta("\\subsection{<>}", { i(1) })),
  s(
    { trig = "subsubsection", dscr = "Exands 'subsubsection' into '\\subsubsection{}'" },
    fmta("\\subsubsection{<>}", { i(1) })
  ),

  -- env
  s(
    { trig = "begin", dscr = "Expands 'begin' into environment" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
      ]],
      { i(1, "env"), i(0), rep(1) }
    )
  ),
  s(
    { trig = "align", dscr = "Expands 'align' into align* environment" },
    fmta(
      [[
      \begin{align*}
          <>
      \end{align*}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "cases", dscr = "Expands 'cases' into cases environment" },
    fmta(
      [[
      \begin{cases}
          <>
      \end{cases}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "theorem", dscr = "Expands 'theorem' into theorem environment" },
    fmta(
      [[
      \begin{theorem}
          <>
      \end{theorem}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "lemma", dscr = "Expands 'lemma' into lemma environment" },
    fmta(
      [[
      \begin{lemma}
          <>
      \end{lemma}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "defn", dscr = "Expands 'defn' into defn environment" },
    fmta(
      [[
      \begin{defn}
          <>
      \end{defn}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "proof", dscr = "Expands 'proof' into proof environment" },
    fmta(
      [[
      \begin{proof}
          <>
      \end{proof}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "prob", dscr = "Expands 'prob' into problem environment" },
    fmta(
      [[
      \begin{problem}
          <>
      \end{problem}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "probN", dscr = "Expands 'probN' into problemnamed environment" },
    fmta(
      [[
      \begin{problemnamed}
          <>
      \end{problemnamed}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "sol", dscr = "Expands 'sol' into solution environment" },
    fmta(
      [[
      \begin{solution}
          <>
      \end{solution}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "enumerate", dscr = "Expands 'enumerate' into enumerate environment" },
    fmta(
      [[
      \begin{enumerate}
          \item <>
      \end{enumerate}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "itemize", dscr = "Expands 'itemize' into itemize environment" },
    fmta(
      [[
      \begin{itemize}
          \item <>
      \end{itemize}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "alphenum", dscr = "Expands 'alphenum' into enumerate (with bold alph) environment" },
    fmta(
      [[
      \begin{enumerate}[label=\bfalph]
          \item <>
      \end{enumerate}
      ]],
      { i(1) }
    )
  ),
}
