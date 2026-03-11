---
description: "Scaffold a new webapp with the design system pre-integrated"
argument-hint: "[project-name]"
disable-model-invocation: true
---

Architect and scaffold a new web application using the charliejmwilliams.com design system.

Use `$ARGUMENTS` as the project name if provided. Otherwise, ask the user for a project name.

**Before starting:** Fetch and read the full style guide:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

---

## Step 1 — Confirm the stack

If the user has not specified a stack, ask them to choose:

- **A) Static HTML** — no build step, plain `.html` + `.css` + optional `.js`
- **B) Flask** — Python backend, Jinja2 templates
- **C) Next.js** — React, App Router, TypeScript

## Step 2 — Apply universal rules

These rules apply to **all stacks**:

1. The design system stylesheet is **always loaded from CDN** — never downloaded or bundled:
   ```html
   <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
   ```
2. **No CSS framework** (Tailwind, Bootstrap, Bulma) is needed. The design system covers all styling.
3. Custom CSS goes in **one scoped override file** (`style.css` / `globals.css`) containing only project-specific additions.
4. Keep JavaScript minimal. Prefer vanilla JS or lightweight libraries.
5. No CSS Modules, styled-components, or CSS-in-JS. Use design system class names directly.
6. Create a `CLAUDE.md` in the project root with design system rules (use the `/ds-setup` pattern).

## Step 3 — Scaffold the project

Follow the template for the chosen stack:

- **Static HTML** — see `static-template.md` in this skill directory for the file structure and patterns.
- **Flask** — see `flask-template.md` in this skill directory for the file structure and patterns.
- **Next.js** — see `nextjs-template.md` in this skill directory for the file structure and patterns.

## Step 4 — Deliverables

Produce:

1. **The complete file structure** with all files created and populated
2. **A working "hello world" page** demonstrating: `.container`, a heading with design tokens, a `.card-flat`, and a `.btn.btn-primary`
3. **A `CLAUDE.md`** in the project root with the design system rules
