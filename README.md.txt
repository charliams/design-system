#Add this to CLAUDE.md:
---

## Design system

This project uses the shared charliejmwilliams.com design system.

Before writing or modifying any UI code, fetch the style guide:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

Rules:
- Every HTML page must have in its <head>:
  `<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">`
  Do not download or copy ui.css locally.
- Use CSS custom properties (e.g. `var(--color-text-muted)`, `var(--space-4)`) for all
  colours, spacing, and typography. Do not hardcode hex values that duplicate tokens.
- Use component classes (.btn, .card, .card-flat, .input, .badge, etc.) rather than
  writing custom equivalents.
- When migrating existing CSS: replace hardcoded values with tokens/classes,
  then delete the now-redundant CSS rules.

---
#Migration Prompt:
---
Migrate this app's UI to the shared charliejmwilliams.com design system.

1. Fetch and read the full style guide:
   https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

2. Ensure every HTML page has in its <head>:
   <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
   Do not download or bundle ui.css locally.

3. Audit all CSS files and inline styles:
   - Replace hardcoded colour hex values with --color-* custom properties
   - Replace hardcoded spacing/sizing with --space-* tokens
   - Replace hardcoded font sizes with --text-* tokens
   - Replace custom button, form, card, and badge styles with the
     .btn, .input, .card, .card-flat, .badge component classes

4. Delete CSS rules now fully covered by ui.css — duplicates cause conflicts.

5. Do not change any application logic, routes, or data. Styling only.
