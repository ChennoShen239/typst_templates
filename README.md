# Typst Templates

Typst templates for slides, course notes, and one-page notes.

## Templates

- `slides.typ` (Touying): 16:9 slide deck, Ysabeau 21pt, theorem environments, customizable header/footer, focus slides, blue citations. Edit the title/content and compile.
- `note.typ` (ILM): Libertinus Serif body text, Libertinus Math equations, APA bibliography via `refs.bib`, figure/table/listing indices, same theorem set, abstract/preface. Update metadata, add refs, write content.
- `short_note.typ`: One-page US Letter layout, numbered headings, centered title/author, orange links. Fill in fields and compile.

## Dependencies

- Common: `@preview/ctheorems:1.1.3`
- Slides: `@preview/touying:0.6.1`
- Notes: `@preview/ilm:1.4.1`

## Quick Start

```bash
typst compile slides.typ
typst compile note.typ
typst compile short_note.typ
```

## Course-note equations

In `note.typ`, displayed equations use `(chapter.equation)` numbering. Each numbered top-level heading (`= Chapter` or `= Lecture`) resets the equation counter: `(1.1)`, `(1.2)`, then `(2.1)`, `(2.2)`. Subsections do not reset it.

Label equations and refer to them with `@label`; references retain the target equation's chapter number even when cited from another chapter:

```typst
= Lecture 1
$ E = m c^2 $ <eq:energy>

= Lecture 2
See @eq:energy. // Refers to Equation (1.1).
$ a^2 + b^2 = c^2 $ <eq:pythagoras> // Numbered (2.1).
```

## Download via Script

Use `typst-template.sh` to list and download templates without cloning (requires `curl` and `jq`):

```bash
chmod +x typst-template.sh
./typst-template.sh
```

Environment overrides:

- `OWNER` (default `ChennoShen239`)
- `REPO` (default `typst_templates`)
- `BRANCH` (default `main`)
- `GITHUB_TOKEN` (optional, raise rate limit)
- `CURL_OPTS` (optional, extra curl args)
