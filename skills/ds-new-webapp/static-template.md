# Static HTML Template

## File structure

```
project/
├── index.html
├── style.css          # scoped overrides only
├── script.js          # optional; omit if not needed
└── CLAUDE.md
```

## `index.html` pattern

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>App Name</title>
  <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container" style="padding: var(--space-10) var(--space-6);">
    <h1 style="font-size: var(--text-4xl); font-weight: 700; letter-spacing: -0.02em; margin: 0 0 var(--space-2);">
      Page Title
    </h1>
    <p style="color: var(--color-text-muted); margin: 0 0 var(--space-8);">Subtitle or description.</p>

    <div class="card-flat" style="padding: var(--space-6);">
      <!-- Content here -->
    </div>
  </div>
</body>
</html>
```

## Key decisions

- Multi-page sites: duplicate the `<head>` block, or use a static site generator (Eleventy, Vite) to template it. Do not use iframes.
- Forms that need a backend: POST to a service (Formspree, Netlify Forms) or a separate API.
- Deploy to: GitHub Pages, Netlify, or Cloudflare Pages.
