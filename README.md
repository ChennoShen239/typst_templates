# Typst Templates

Typst templates for slides, course notes, and one-page notes.

## Templates

- `slides.typ` (Touying): 16:9 slide deck, Ysabeau 21pt, theorem environments, customizable header/footer, focus slides, blue citations. Edit the title/content and compile.
- `note.typ` (ILM): Libertinus Serif body text, Libertinus Math equations, APA bibliography via `refs.bib`, figure/table/listing indices, same theorem set, abstract/preface. Update metadata, add refs, write content.
- `short_note.typ`: Short research memo, 12pt Erewhon text and Erewhon Math, US Letter, 1.3 line spacing, indented paragraphs and plain page numbers. Uses the local `short-note-style.typ` file. Content paginates naturally.

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

## Short research memo

Keep `short-note-style.typ` beside the memo. The entire preamble is:

```typst
#import "short-note-style.typ": *
#show: short-note.with(title: [Memo title], author: "Chen Gao", date: "")
```

The style supplies typography, layout, theorem/proof helpers and table defaults.
Dates and authors can be left blank. Theorem and proof blocks are flush left;
body paragraphs keep their first-line indent.

Tables use booktabs rules: top, below the header and bottom, with no vertical
or body-row borders. For example:

```typst
#table(
  columns: (1fr, 2fr, 1fr),
  table.hline(stroke: 0.7pt),
  table.header([*Symbol*], [*Economic meaning*], [*Unit*]),
  table.hline(stroke: 0.4pt),
  [$w$], [Wage], [USD/year],
  [$r$], [Interest rate], [%/year],
  table.hline(stroke: 0.7pt),
)
```

## Fonts for short_note.typ

Erewhon text pairs with Erewhon Math, OpenType successors to Utopia/Fourier.
Text uses Regular, Italic, Bold and Bold Italic; equations use Erewhon Math,
which includes bold mathematical symbols. Install both supplied math faces.
Do not install the alternative Slanted faces under the same family name.
Songti SC supplies Chinese glyphs on macOS.

Check `typst fonts --variants` for `erewhon` and `Erewhon Math` before compiling.
For local CLI and Zed, install the six `.otf` files in `~/Library/Fonts`.
Existing TeX Live installations expose their locations through:

```bash
kpsewhich Erewhon-Regular.otf
kpsewhich Erewhon-Math.otf
```

On macOS with these TeX Live fonts available:

```bash
mkdir -p "$HOME/Library/Fonts"
for font_file in Erewhon-Regular.otf Erewhon-Italic.otf \
  Erewhon-Bold.otf Erewhon-BoldItalic.otf \
  Erewhon-Math.otf Erewhon-Math-Bold.otf; do
  cp "$(kpsewhich "$font_file")" "$HOME/Library/Fonts/"
done
typst fonts --variants
typst compile short_note.typ
```

With fonts installed, the Quick Start command needs no font flags. Alternatively,
pass the text and math font directories with two `--font-path` arguments. The
TeX font directory alone is not searched by Typst. For the Typst web app, upload
all six fonts into the document project.

Layout: white paper; 2cm side margins; 1.35in top/bottom margins; 1.5cm
footskip; 18.85pt body baselines (LaTeX article 12pt baseline × 1.3). This is
an adaptation in Typst; TeX and Typst can differ in line breaking and pagination.

Font sources: [Erewhon](https://ctan.org/pkg/erewhon),
[Erewhon Math](https://ctan.org/pkg/erewhon-math).

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

Use `typst-template.sh` to list and download templates without cloning (requires `curl` and `jq`). Selecting `short_note.typ` also downloads `short-note-style.typ`:

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
