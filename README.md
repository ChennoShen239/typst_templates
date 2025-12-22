# Typst Templates

A collection of Typst templates for academic presentations and course notes.

## Templates

### `slides.typ` - Presentation Template

A presentation template using [Touying](https://typst.app/universe/package/touying) with:

- **Theme**: Simple theme with 16:9 aspect ratio
- **Font**: Ysabeau (21pt)
- **Features**:
  - Pre-configured theorem environments (theorem, proposition, corollary, lemma, definition, example, proof)
  - Customizable header/footer
  - Focus slides support
  - Blue citations

**Usage**: Edit the title slide and content sections, then compile with Typst.

### `note.typ` - Course Notes Template

A course notes template using [ILM](https://typst.app/universe/package/ilm) with:

- **Font**: Libertinus Serif
- **Features**:
  - Bibliography support (APA style) via `refs.bib`
  - Figure, table, and listing indices
  - Same theorem environments as slides template
  - Abstract and preface sections

**Usage**:

1. Update course metadata (title, author, abstract)
2. Add references to `refs.bib`
3. Write your content using the predefined theorem environments

### `short_note.typ` - One-Page Note Template

A minimalist one-page note template with:

- **Page setup**: US Letter, single-page numbering
- **Headings**: Numbered, level-2 headings bold+italic with trailing period
- **Typography**: Centered title (20pt) and author block; orange links
- **Quick start**: Fill in title/author and content, then compile with Typst

## Dependencies

Both templates use:

- `@preview/ctheorems:1.1.3` - Theorem environments

Additional dependencies:

- `slides.typ`: `@preview/touying:0.6.1`
- `note.typ`: `@preview/ilm:1.4.1`

## Quick Start

1. Install [Typst](https://typst.app/)
2. Compile templates:
   ```bash
   typst compile slides.typ
   typst compile note.typ
   ```

## Downloading Templates via Script

You can also use the `typst-template.sh` helper script to browse and download templates from this repository without cloning it:

```bash
chmod +x typst-template.sh
./typst-template.sh
```

Optional environment variables:

- `OWNER` – GitHub username (default: `ChennoShen239`)
- `REPO` – repository name (default: `typst_templates`)
- `BRANCH` – branch name (default: `main`)
- `GITHUB_TOKEN` – GitHub token to increase API rate limits (optional)
- `CURL_OPTS` – extra options passed to `curl` (optional)

## Customization

- **Colors**: Modify the `primary` color in `slides.typ` or theorem `fill` colors in both templates
- **Fonts**: Change `font` settings in the `#set text()` commands
- **Theme**: Adjust theme parameters in `#show: simple-theme.with()` or `#show: ilm.with()`
