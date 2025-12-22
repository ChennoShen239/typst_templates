#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

#set heading(numbering: "1.")
#set page(
  paper: "us-letter",
  numbering: "1/1",
)
#show title: set text(size: 20pt)
#show title: set align(center)
#show link: set text(fill: orange)

#show heading.where(level: 2): set text(
  weight: "bold",
  style: "italic",
)
#show heading.where(level: 2): it => {
  it.body + [.]
}




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



#title[
  Some title
]

#align(center)[
  Chen Gao #footnote[NSD,PKU, #link("mailto:chengao0716@gmail.com")]\
  #datetime.today().display()
]

= Example 1

#lorem(50)

== Example 1.1
#lorem(100)

#theorem[name of theorem][#lorem(20)]<thm:1>
