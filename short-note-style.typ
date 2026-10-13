// Erewhon text and math for research memos.
#import "@preview/ctheorems:1.1.3": thmplain, thmproof, thmrules

#let theorem = thmplain("theorem", "Theorem", base_level: 1, inset: 0pt, bodyfmt: emph)
#let proposition = thmplain("proposition", "Proposition", base_level: 1, inset: 0pt, bodyfmt: emph)
#let corollary = thmplain("corollary", "Corollary", titlefmt: strong, base: "theorem", inset: 0pt, bodyfmt: emph)
#let lemma = thmplain("lemma", "Lemma", base_level: 1, inset: 0pt, bodyfmt: emph)
#let definition = thmplain("definition", "Definition", base_level: 1, inset: 0pt)
#let example = thmplain("example", "Example", titlefmt: strong, base_level: 1, inset: 0pt)
#let proof = thmproof("proof", "Proof", inset: 0pt)

#let short-note(title: [], author: "", date: "", body) = {
  set document(title: title, author: author)
  set text(
    font: ("erewhon", "Songti SC"), size: 12pt, lang: "en",
    top-edge: 0.8em, bottom-edge: -0.2em,
  )
  show math.equation: set text(font: "Erewhon Math")
  // LaTeX article 12pt: 14.5pt baseline × 1.3 = 18.85pt.
  set par(justify: true, first-line-indent: 1.5em, leading: 6.85pt, spacing: 6.85pt)
  set page(
    paper: "us-letter", fill: white,
    margin: (x: 2cm, y: 1.35in),
    numbering: "1", number-align: center + bottom,
    footer-descent: 1.5cm - 0.8em,
  )
  set heading(numbering: "1.")
  show heading.where(level: 1): set text(size: 14pt, weight: "bold")
  show heading.where(level: 2): set text(size: 12pt, weight: "bold")
  show std.title: set text(size: 20pt, weight: "regular")
  show std.title: set align(center)
  show std.title: set block(above: 0pt, below: 0.75em)
  show link: set text(fill: rgb("000099"))
  show ref: set text(fill: rgb("990000"))
  set table(stroke: none, inset: (x: 6pt, y: 5pt))
  show table: set par(first-line-indent: 0pt, justify: false)
  show figure.where(kind: "thmenv"): set par(first-line-indent: 0pt)
  set math.equation(numbering: "(1)")

  if title != [] { std.title(title) }
  if author != "" or date != "" {
    align(center, block(above: 0pt, below: 1em)[
      #author
      #if author != "" and date != "" { linebreak() }
      #date
    ])
  }
  thmrules(qed-symbol: $square$, body)
}
