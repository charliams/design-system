# Next.js Template

## File structure

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
├── CLAUDE.md
├── next.config.ts
├── tsconfig.json
└── package.json
```

## `app/layout.tsx` pattern

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

## Key decisions

- **Server Components by default.** Add `'use client'` only where browser APIs or interactivity are required.
- **Data fetching in Server Components or Route Handlers** — not in client components. Avoid `useEffect` for data fetching.
- **No CSS Modules, no Tailwind, no styled-components.** Apply design system class names directly in JSX `className` props.
- **TypeScript always.** No `any` types without a comment explaining why.
- **State management:** `useState` / `useContext` for local/shared state. Add Zustand or Jotai only if genuinely needed.
- **Environment variables:** `NEXT_PUBLIC_` prefix only for values safe to expose to the browser.
