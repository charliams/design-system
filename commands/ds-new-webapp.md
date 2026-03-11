Architect and scaffold a new web application using the charliejmwilliams.com design system.

**Before starting:** Fetch and read the full style guide:
https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md

---

## Step 1 — Confirm the stack

If the user has not specified a stack, ask them to choose:

- **A) Static HTML** — no build step, plain `.html` + `.css` + optional `.js`
- **B) Flask** — Python backend, Jinja2 templates
- **C) Next.js** — React, App Router, TypeScript

Then proceed with the architecture for their choice below.

---

## Universal rules (all stacks)

- The design system stylesheet is **always loaded from CDN** — never downloaded or bundled locally:
  ```html
  <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
  ```
- **No CSS framework** (Tailwind, Bootstrap, Bulma) is needed or appropriate. The design system covers layout, typography, and all component styling.
- Custom CSS goes in **one scoped override file** (`style.css` / `globals.css`). It contains only project-specific additions — never re-implementing tokens or components.
- Keep JavaScript minimal. Prefer vanilla JS or a lightweight library. Reach for a full framework only when the data model genuinely demands it.
- No CSS Modules, styled-components, or CSS-in-JS. Use design system class names directly on elements.
- Create a `CLAUDE.md` in the project root using the `/ds-setup` command (or include the design system rules block from the start).

---

## A) Static HTML

### File structure

```
project/
├── index.html
├── style.css          # scoped overrides only
└── script.js          # optional; omit if not needed
```

### `index.html` pattern

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

### Key decisions

- Multi-page sites: duplicate the `<head>` block, or use a static site generator (Eleventy, Vite) to template it. Do not use iframes.
- Forms that need a backend: POST to a service (Formspree, Netlify Forms) or a separate API. Never handle sensitive data client-side.
- Deploy to: GitHub Pages, Netlify, or Cloudflare Pages.

---

## B) Flask

### File structure

```
project/
├── app.py                 # or __init__.py for larger apps
├── requirements.txt
├── .env                   # secrets — never commit
├── .gitignore             # must include .env
├── templates/
│   ├── base.html          # root layout with CDN link
│   └── index.html         # extends base.html
└── static/
    └── style.css          # scoped overrides only
```

### `templates/base.html` pattern

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% block title %}App Name{% endblock %}</title>
  <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
  <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
</head>
<body>
  <div class="container" style="padding: var(--space-10) var(--space-6);">
    {% block content %}{% endblock %}
  </div>
</body>
</html>
```

### Key decisions

- Environment config via `.env` + `python-dotenv`. **Never hardcode secrets** in `app.py`.
- Persistence: **SQLite first** (`flask-sqlalchemy` + SQLite). Migrate to Postgres only when concurrency or scale demands it.
- Authentication: Flask-Login for session-based auth. Defer to an OAuth provider (Auth0, GitHub OAuth) for anything externally facing.
- API routes return JSON; page routes return rendered templates. Do not mix these concerns in a single route.
- Keep `requirements.txt` minimal. Add a dependency only when you have a clear reason.

---

## C) Next.js

### File structure

```
project/
├── app/
│   ├── layout.tsx         # root layout — CDN link lives here
│   ├── page.tsx           # home page
│   └── globals.css        # scoped overrides only; no Tailwind resets
├── components/            # shared UI components
├── lib/                   # utilities, API clients, data-fetching helpers
├── public/                # static assets (images, favicon)
├── .env.local             # secrets — never commit
├── .gitignore             # must include .env.local
├── next.config.ts
├── tsconfig.json
└── package.json
```

### `app/layout.tsx` pattern

```tsx
import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'App Name',
  description: 'App description',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css" />
      </head>
      <body>{children}</body>
    </html>
  )
}
```

### Key decisions

- **Server Components by default.** Add `'use client'` only where browser APIs or interactivity (event listeners, `useState`) are required.
- **Data fetching in Server Components or Route Handlers** — not in client components. Avoid `useEffect` for data fetching.
- **No CSS Modules, no Tailwind, no styled-components.** Apply design system class names directly in JSX `className` props.
- **TypeScript always.** No `any` types without a comment explaining why.
- **State management:** `useState` / `useContext` for local/shared state. Add Zustand or Jotai only if genuinely needed across many components.
- **Environment variables:** `NEXT_PUBLIC_` prefix only for values safe to expose to the browser. Everything else stays server-side.

---

## Step 2 — Scaffold the project

After the user confirms their stack and answers any project-specific questions (project name, primary features, auth requirements, data model), produce:

1. **The complete file structure** with all files created and populated
2. **A working "hello world"** that demonstrates a page using `.container`, a heading styled with design tokens, a `.card-flat`, and a `.btn.btn-primary`
3. **A `CLAUDE.md`** in the project root containing the design system rules (the four rules from the design system's README)

The hello-world page should render correctly with no additional setup beyond installing dependencies.
