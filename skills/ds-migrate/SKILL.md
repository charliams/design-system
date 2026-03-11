---
description: "Migrate an existing app's UI to the charliejmwilliams.com design system"
argument-hint: "[path-to-project]"
disable-model-invocation: true
---

Migrate this project's UI to the charliejmwilliams.com design system.

If `$ARGUMENTS` is provided, use it as the project path. Otherwise, use the current working directory.

**Before starting:** Fetch and read the full style guide so you have the complete token and component reference:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

---

## Step 1 — Identify the framework

Determine whether this is a static HTML project, Flask/Jinja2, Next.js/React, or another framework. The entry point for the stylesheet link differs per stack:

- **Static HTML**: every `.html` file's `<head>`
- **Flask/Jinja2**: `base.html` (or equivalent root template)
- **Next.js App Router**: `app/layout.tsx` (or `app/layout.js`)
- **Next.js Pages Router**: `pages/_document.tsx`

## Step 2 — Check for conflicting CSS resets

Search for any existing CSS reset or normalize stylesheet (normalize.css, reset.css, Tailwind base, Bootstrap reboot). If found, note it in the report — the design system includes its own baseline, so conflicting resets should be removed or scoped to avoid specificity conflicts.

## Step 3 — Add the stylesheet link

Every root layout / base template must have exactly this in `<head>`:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

Do **not** download, bundle, or copy `ui.css` locally. If it already exists with this exact href, skip this step.

## Step 4 — Audit all CSS for hardcoded values

Search every `.css`, `.scss`, `.module.css` file and any inline `style` attributes for:

| Find | Replace with |
|------|-------------|
| Hardcoded hex/rgb colour values | `var(--color-*)` custom properties |
| Hardcoded `px`/`rem` spacing or sizing | `var(--space-*)` tokens |
| Hardcoded font sizes | `var(--text-*)` tokens |
| Hardcoded font families | `var(--font-sans)` or `var(--font-mono)` |
| Hardcoded border-radius values | `var(--radius-*)` tokens |
| Hardcoded box-shadow values | `var(--shadow-*)` tokens |
| Hardcoded transition values | `var(--transition)` or `var(--transition-slow)` |

Only replace values that have a direct token equivalent. If a value has no matching token (e.g. a brand colour not in the palette), **leave it unchanged and flag it** in the report as a decision for the user.

## Step 5 — Replace custom component styles with classes

Identify any custom styles for buttons, inputs, selects, textareas, cards, and badges. Replace the custom CSS + HTML with the design system component classes:

| Custom element | Use class(es) |
|---------------|--------------|
| Primary button | `.btn.btn-primary` |
| Secondary/outline button | `.btn.btn-ghost` |
| Destructive button | `.btn.btn-danger` |
| Small button variant | add `.btn-sm` |
| Large button variant | add `.btn-lg` |
| Text input | `.input` |
| Select dropdown | `.select` |
| Textarea | `.textarea` |
| Form field wrapper | `.form-group` |
| Form label | `.label` |
| Hoverable card | `.card` |
| Static panel / form container | `.card-flat` |
| Status badge | `.badge` + `.badge-success` / `.badge-danger` / `.badge-warning` / `.badge-info` |
| Page wrapper | `.container` |

## Step 6 — Delete redundant CSS rules

Remove any CSS rules now fully covered by `ui.css`. Duplicates cause specificity conflicts that break the visual output. Do not leave commented-out blocks behind.

## Step 7 — Do not touch application logic

Do **not** change any routes, API calls, data models, JavaScript logic, or template control flow. This step is styling-only. If a change feels like it affects behaviour, skip it and note it in the report.

## Step 8 — Output a migration report

After completing, produce a concise summary:

```
## Migration Report

**Files modified:** [list]
**Stylesheet link added to:** [list]
**Tokens introduced:** [e.g. --color-text, --space-4, --text-sm ...]
**Component classes applied:** [e.g. .btn.btn-primary on 3 elements ...]
**CSS rules deleted:** [approximate count or list of rule selectors]
**Conflicting resets found:** [any CSS resets that were removed or noted]
**Unmapped values (needs user decision):** [hardcoded values with no matching token]
**Judgement calls / left unchanged:** [anything ambiguous or project-specific]
```
