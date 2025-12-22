# Typst Templates

Typst templates for slides, course notes, and one-page notes.

## Templates

- `slides.typ` (Touying): 16:9 slide deck, Ysabeau 21pt, theorem environments, customizable header/footer, focus slides, blue citations. Edit the title/content and compile.
- `note.typ` (ILM): Libertinus Serif, APA bibliography via `refs.bib`, figure/table/listing indices, same theorem set, abstract/preface. Update metadata, add refs, write content.
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

## Customization

- Colors: adjust `primary` in `slides.typ` or theorem fills.
- Fonts: change `#set text(...)` settings.
- Theme: tweak `simple-theme.with(...)` or `ilm.with(...)`.
