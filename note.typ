#import "@preview/ilm:1.4.1": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)
#show link: set text(fill: orange)

#show math.equation: set text(font: "Libertinus Serif")
#set text(lang: "en", font: "Libertinus Serif")
#show: ilm.with(
  title: [Course Name],
  author: "Author",
  date: datetime.today(),
  abstract: [
    Abstract of the course.
  ],
  preface: [
    #align(center + horizon)[
      Thanks to typst! This basic template is modified from #link("https://typst.app/universe/package/ilm", "ilm") and benefits from #link("https://typst.app/universe/package/ctheorems", "ctheorems").
    ]
  ],
  bibliography: bibliography("refs.bib", style: "apa"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)


#let theorem = thmbox("theorem", "Theorem", fill: red.lighten(90%), base_level: 2)
#let proposition = thmbox("proposition", "Proposition", fill: blue.lighten(90%), base_level: 2)
#let corollary = thmplain(
  "corollary",
  "Corollary",
  titlefmt: strong,
  base: "theorem",
)
#let lemma = thmbox("lemma", "Lemma", fill: orange.lighten(90%), base_level: 2)
#let definition = thmbox("definition", "Definition", base_level: 2, fill: teal.lighten(80%))
#let example = thmbox("example", "Example", titlefmt: strong, fill: green.lighten(90%), base_level: 2)

#let proof = thmproof("proof", "Proof")




#set math.equation(numbering: "(1)")
#show ref: it => {
  set text(fill: blue)
  it
}

= Example Chapter

#lorem(50)
== Example Definition


#definition[#lorem(20)]<def:1>

We can refer to this definition by @def:1,

#theorem[#lorem(20)]<thm:1>

#proof[#lorem(20)]<proof:1>
