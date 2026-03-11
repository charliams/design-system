---
description: "Audit a project for design system compliance (read-only, no changes)"
argument-hint: "[path-to-project]"
disable-model-invocation: true
---

Audit this project's compliance with the charliejmwilliams.com design system. **Do not modify any files** — this is a read-only analysis.

If `$ARGUMENTS` is provided, use it as the project path. Otherwise, use the current working directory.

**Before starting:** Fetch and read the full style guide:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

---

## Step 1 — Check stylesheet link

Search for the design system stylesheet link in all HTML entry points and root layouts:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

Report whether it is present, missing, or using an incorrect URL (e.g. a local copy).

## Step 2 — Check for conflicting frameworks

Search for any CSS framework that conflicts with the design system:
- Tailwind CSS (look for `tailwind.config.*`, `@tailwind` directives)
- Bootstrap (look for `bootstrap` in package.json or CSS imports)
- Bulma, Foundation, or other CSS frameworks
- CSS-in-JS libraries (styled-components, emotion) in package.json

Report any conflicts found.

## Step 3 — Scan for hardcoded values

Search all `.css`, `.scss`, `.module.css` files and inline `style` attributes for:

| Category | Pattern to flag |
|----------|----------------|
| Colours | Hex values (`#xxx`, `#xxxxxx`), `rgb()`, `hsl()` that have a design system token equivalent |
| Spacing | Hardcoded `px`/`rem` values that match a `--space-*` token |
| Font sizes | Hardcoded sizes that match a `--text-*` token |
| Font families | Hardcoded font-family declarations |
| Border radius | Hardcoded radius values that match a `--radius-*` token |
| Box shadows | Hardcoded shadow values |
| Transitions | Hardcoded transition durations |

For each violation, note the file, line, current value, and the recommended token.

## Step 4 — Check component class usage

Identify any custom component styles that duplicate design system classes:
- Custom button styles that should use `.btn`
- Custom input/select/textarea styles that should use `.input` / `.select` / `.textarea`
- Custom card-like containers that should use `.card` or `.card-flat`

## Step 5 — Check CLAUDE.md

Verify that the project's `CLAUDE.md` (if it exists) includes the design system rules section with:
- The stylesheet link instruction
- The token usage rules
- The style guide fetch URL

## Step 6 — Output the audit report

```
## Design System Audit Report

**Overall compliance:** [High / Medium / Low]

### Stylesheet Link
- Status: [Present / Missing / Incorrect URL]
- Location: [file(s)]

### Conflicting Frameworks
- [List of conflicts, or "None found"]

### Hardcoded Values
- Total violations: [count]
- By category:
  - Colours: [count] (files: ...)
  - Spacing: [count] (files: ...)
  - Typography: [count] (files: ...)
  - Other: [count] (files: ...)

### Component Class Opportunities
- [List of custom styles that could use DS classes]

### CLAUDE.md
- Status: [Present with DS rules / Present without DS rules / Missing]

### Recommended Next Steps
1. [Prioritised list of actions to improve compliance]
```
