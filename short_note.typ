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
