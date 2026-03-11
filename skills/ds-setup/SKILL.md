---
description: "Add the design system stylesheet and rules to a project"
disable-model-invocation: true
---

Add the charliejmwilliams.com design system to this project.

This command does two things:
1. Adds the CDN stylesheet link to any HTML entry points or root layouts found in this project.
2. Creates or updates `CLAUDE.md` in the project root with the design system rules, so future Claude Code sessions in this project automatically know the constraints.

---

## Step 1 — Add the stylesheet link

Search for root layout / entry point files:

| Framework | File to target |
|-----------|---------------|
| Static HTML | Every `.html` file in the project root and any `templates/` directory |
| Flask/Jinja2 | `base.html`, `layout.html`, or equivalent root template |
| Next.js App Router | `app/layout.tsx` or `app/layout.js` |
| Next.js Pages Router | `pages/_document.tsx` or `pages/_document.js` |

For each file found, check whether this exact `<link>` tag already exists in `<head>`:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

If it does not exist, add it as the **last** `<link>` in `<head>` (so it loads after any project-specific stylesheets it needs to complement, but before any inline styles). If the file has no `<head>`, add one.

Do **not** download, copy, or bundle `ui.css` locally.

## Step 2 — Create or update CLAUDE.md

In the project root, check if `CLAUDE.md` exists.

**If it exists:** Search for a `## Design system` section. If found, update it in place. If not found, append the block below.

**If it does not exist:** Create `CLAUDE.md` with the block below.

```markdown
## Design system

This project uses the shared charliejmwilliams.com design system.

Before writing or modifying any UI code, fetch and read the full style guide:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

Rules:
- Every HTML page must have in its `<head>`:
  `<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">`
  Do not download or copy ui.css locally.
- Use CSS custom properties (e.g. `var(--color-text-muted)`, `var(--space-4)`) for all
  colours, spacing, and typography. Do not hardcode hex values that duplicate tokens.
- Use component classes (`.btn`, `.card`, `.card-flat`, `.input`, `.badge`, etc.) rather
  than writing custom equivalents.
- No CSS frameworks (Tailwind, Bootstrap), no CSS-in-JS, no CSS Modules.
- When migrating existing CSS: replace hardcoded values with tokens/classes,
  then delete the now-redundant CSS rules.
```

## Step 3 — Report

Output a brief summary of what was done:

```
## Setup Report

**Stylesheet link added to:** [list of files, or "already present in all entry points"]
**CLAUDE.md:** [created / updated / already up to date]
```
