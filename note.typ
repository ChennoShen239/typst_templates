#import "@preview/ilm:1.4.1": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)
#show link: set text(fill: orange)

#show math.equation: set text(font: "Libertinus Math")
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




#show heading.where(level: 1): it => {
  // Each numbered top-level heading starts a new chapter or lecture.
  if it.numbering != none {
    counter(math.equation).update(0)
  }
  it
}
#set math.equation(numbering: n => context {
  numbering("(1.1)", counter(heading).get().first(), n)
})
#show ref: it => context {
  set text(fill: blue)
  let target = it.element
  if target != none and target.func() == math.equation and it.form == "normal" {
    // Read both counters at the cited equation, not at the reference.
    let loc = target.location()
    let supplement = it.supplement
    if supplement == auto { supplement = target.supplement }
    if type(supplement) == function { supplement = supplement(target) }
    let prefix = if supplement == none or supplement == [] { [] } else { [#supplement~] }
    show link: set text(fill: blue)
    link(it.target, [#prefix#numbering(
      "(1.1)",
      counter(heading).at(loc).first(),
      counter(math.equation).at(loc).first(),
    )])
  } else {
    it
  }
}

= Example Chapter

#lorem(50)
== Example Definition


#definition[#lorem(20)]<def:1>

We can refer to this definition by @def:1,

#theorem[#lorem(20)]<thm:1>

#proof[#lorem(20)]<proof:1>
