# Style Guide — charliejmwilliams.com Design System

Include the shared stylesheet in any app with a single line:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

---

## Aesthetic Direction

**Precision Data** — Clean white surfaces, sharp typographic hierarchy, a monochrome neutral base with a single vivid electric blue for interactive/action elements. Think: a well-designed data dashboard. Precise, functional, opinionated without being distracting.

What this means in practice:
- One accent colour. Everything interactive is blue; everything status-related uses the semantic palette (danger, success, warning, info).
- Generous whitespace. Let data breathe.
- Strong typographic hierarchy. Size and weight do the work — avoid border-heavy, card-heavy layouts.
- Micro-animations for feedback, not decoration. Transitions signal state changes; they don't entertain.

---

## Design Tokens

All tokens are CSS custom properties on `:root`. Use them with `var(--token-name)`.

### Colours

| Token | Value | Usage |
|---|---|---|
| `--color-bg` | `#ffffff` | Page background |
| `--color-surface` | `#f8fafc` | Subtle surface (e.g. card-flat, inputs) |
| `--color-surface-2` | `#f1f5f9` | Deeper surface layer |
| `--color-border` | `#e2e8f0` | Default borders |
| `--color-border-hover` | `#cbd5e1` | Border on hover |
| `--color-text` | `#0f172a` | Primary text |
| `--color-text-muted` | `#64748b` | Secondary / supporting text |
| `--color-text-subtle` | `#94a3b8` | Placeholder / de-emphasised text |
| `--color-accent` | `#0055e9` | Primary action colour — links, buttons, active states |
| `--color-accent-hover` | `#0044c8` | Primary action hover |
| `--color-danger` | `#dc2626` | Destructive actions / errors |
| `--color-danger-hover` | `#b91c1c` | Danger hover |
| `--color-success` | `#16a34a` | Success states |
| `--color-success-hover` | `#15803d` | Success hover |
| `--color-warning` | `#d97706` | Warning states / caution |
| `--color-warning-hover` | `#b45309` | Warning hover |
| `--color-info` | `#0284c7` | Informational states |
| `--color-info-hover` | `#0369a1` | Info hover |

#### Dark mode

When `prefers-color-scheme: dark` is active, all `--color-*` tokens are reassigned:

| Token | Dark value |
|---|---|
| `--color-bg` | `#0f172a` |
| `--color-surface` | `#1e293b` |
| `--color-surface-2` | `#334155` |
| `--color-border` | `#334155` |
| `--color-border-hover` | `#475569` |
| `--color-text` | `#f8fafc` |
| `--color-text-muted` | `#94a3b8` |
| `--color-text-subtle` | `#64748b` |
| `--color-accent` | `#3b82f6` |
| `--color-accent-hover` | `#60a5fa` |
| `--color-danger` | `#ef4444` |
| `--color-danger-hover` | `#dc2626` |
| `--color-success` | `#22c55e` |
| `--color-success-hover` | `#16a34a` |
| `--color-warning` | `#f59e0b` |
| `--color-warning-hover` | `#d97706` |
| `--color-info` | `#38bdf8` |
| `--color-info-hover` | `#0ea5e9` |

Dark mode is automatic via `@media (prefers-color-scheme: dark)` — no JavaScript or class toggles needed. The semantic token names remain identical, so no code changes are required to support dark mode.

### Typography

Load the font via Google Fonts. Add to every page's `<head>` **before** the ui.css link:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300..700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

| Token | Value |
|---|---|
| `--font-sans` | `"Outfit", system-ui, -apple-system, sans-serif` |
| `--font-mono` | `"JetBrains Mono", "Fira Code", monospace` |

**Why Outfit:** Geometric, modern, distinctive — not a generic system font. High x-height for readability at small sizes. Clear, open numerals for data-heavy UIs. Pairs well with JetBrains Mono for any inline code or monospaced data.

#### Type scale

| Token | rem | px |
|---|---|---|
| `--text-xs` | 0.75rem | 12px |
| `--text-sm` | 0.875rem | 14px |
| `--text-base` | 1rem | 16px |
| `--text-lg` | 1.125rem | 18px |
| `--text-xl` | 1.25rem | 20px |
| `--text-2xl` | 1.5rem | 24px |
| `--text-3xl` | 1.875rem | 30px |
| `--text-4xl` | 2.25rem | 36px |
| `--text-5xl` | 3rem | 48px |

Typical heading styles:
- **Display** — `--text-5xl`, weight 700, tracking `-0.03em`
- **H1** — `--text-4xl`, weight 700, tracking `-0.02em`
- **H2** — `--text-3xl`, weight 600, tracking `-0.01em`
- **H3** — `--text-2xl`, weight 600
- **Body** — `--text-base`, line-height 1.6, weight 400
- **Small / muted** — `--text-sm`, `color: var(--color-text-muted)`
- **Data / stats** — `--text-3xl` or `--text-4xl`, weight 700, `font-variant-numeric: tabular-nums`

### Spacing

| Token | Value |
|---|---|
| `--space-1` | 4px |
| `--space-2` | 8px |
| `--space-3` | 12px |
| `--space-4` | 16px |
| `--space-5` | 20px |
| `--space-6` | 24px |
| `--space-8` | 32px |
| `--space-10` | 40px |
| `--space-12` | 48px |
| `--space-16` | 64px |

### Border radius

| Token | Value |
|---|---|
| `--radius-sm` | 6px |
| `--radius-md` | 10px |
| `--radius-lg` | 14px |
| `--radius-xl` | 20px |
| `--radius-full` | 9999px |

### Shadows

| Token | Value | Usage |
|---|---|---|
| `--shadow-xs` | `0 1px 2px rgba(15, 23, 42, 0.06)` | Barely-there lift |
| `--shadow-sm` | `0 1px 3px rgba(15, 23, 42, 0.08), 0 1px 2px rgba(15, 23, 42, 0.04)` | Default card shadow |
| `--shadow-md` | `0 4px 6px rgba(15, 23, 42, 0.07), 0 2px 4px rgba(15, 23, 42, 0.06)` | Hovered card / popover |
| `--shadow-lg` | `0 10px 15px rgba(15, 23, 42, 0.08), 0 4px 6px rgba(15, 23, 42, 0.05)` | Modals / drawers |

### Transitions

| Token | Value |
|---|---|
| `--transition` | `150ms cubic-bezier(0.4, 0, 0.2, 1)` |
| `--transition-slow` | `300ms cubic-bezier(0.4, 0, 0.2, 1)` |

### Focus

| Token | Value | Usage |
|---|---|---|
| `--focus-ring` | `0 0 0 3px rgba(0, 85, 233, 0.2)` | Focus-visible outline on interactive elements |

All interactive elements (`.btn`, `.input`, `.select`, `.textarea`) use `box-shadow: var(--focus-ring)` on `:focus-visible`. In dark mode: `0 0 0 3px rgba(59, 130, 246, 0.3)`.

### Motion guidelines

From the **frontend-design** skill: prioritise high-impact moments over scattered micro-interactions.

- **Page load**: Staggered reveals with `animation-delay` (e.g. 50ms between rows) create delight without clutter.
- **State changes**: Use `--transition` (150ms) for immediate feedback (hover, focus, active). Use `--transition-slow` (300ms) for modal open/close, panel slide-in.
- **Data updates**: Fade new values in (`opacity 0 → 1` over 200ms) so the user notices something changed.
- **Cards**: `.card` lifts on hover (`translateY(-2px)`) — the only transform animation in the system.
- **Disable all animations** when `prefers-reduced-motion: reduce` is active (handled by ui.css).

### Accessibility

**Reduced motion:** When `prefers-reduced-motion: reduce` is active, `--transition` and `--transition-slow` are set to `0ms` and all `transform` animations are disabled.

**Contrast ratios (light mode):**

| Combination | Ratio | WCAG |
|---|---|---|
| `--color-text` on `--color-bg` | 19.1:1 | AAA |
| `--color-text-muted` on `--color-bg` | 5.1:1 | AA |
| `--color-text-subtle` on `--color-bg` | 3.3:1 | AA Large |
| `--color-accent` on `--color-bg` | 5.5:1 | AA |
| `--color-danger` on `--color-bg` | 4.6:1 | AA |
| `--color-success` on `--color-bg` | 4.5:1 | AA |
| `--color-warning` on `--color-bg` | 4.6:1 | AA |

**Screen readers:** Use `.sr-only` for text visible only to screen readers (see Misc section).

---

## Component Classes

### Layout

```html
<div class="container">…</div>
```
Max-width 1100px, centred, with horizontal padding. Responsive (padding reduces on mobile).

For full-width data dashboards, use `max-w-full` or inline `style="max-width: 1400px"` on the container.

---

### Cards

```html
<!-- Hoverable card — use for clickable surfaces or data panels -->
<div class="card">…</div>

<!-- Flat card — use for forms, filter panels, code blocks -->
<div class="card-flat">…</div>
```

`.card` — `--shadow-sm`, lifts on hover (`translateY(-2px)`, `--shadow-md`).
`.card-flat` — `--color-surface` background, `--color-border` border, no shadow, no hover effect.

---

### Buttons

```html
<button class="btn btn-primary">Primary</button>
<button class="btn btn-ghost">Ghost</button>
<button class="btn btn-danger">Danger</button>

<!-- Sizes -->
<button class="btn btn-primary btn-sm">Small</button>
<button class="btn btn-primary btn-lg">Large</button>
```

| Class | Description |
|---|---|
| `.btn` | Base — **always required** alongside a variant class |
| `.btn-primary` | Filled `--color-accent`, white text — main CTA |
| `.btn-ghost` | Transparent with `--color-border` border — secondary action |
| `.btn-danger` | `--color-danger` text, transparent — destructive action |
| `.btn-sm` | 28px min-height, `--text-xs` |
| `.btn-lg` | 44px min-height, `--text-base` — use for primary CTAs on mobile |

---

### Forms

```html
<div class="form-group">
  <label class="label" for="my-input">Label text</label>
  <input id="my-input" class="input" placeholder="Placeholder" />
  <span class="input-hint">Supporting hint text</span>
</div>

<div class="form-group">
  <label class="label" for="my-select">Select</label>
  <select id="my-select" class="select">
    <option>Option 1</option>
  </select>
</div>

<div class="form-group">
  <label class="label" for="my-textarea">Textarea</label>
  <textarea id="my-textarea" class="textarea" placeholder="Longer text…"></textarea>
</div>
```

`.input`, `.select`, `.textarea` all share the same sizing (min-height 40px on desktop, 44px on mobile) and focus ring (`var(--focus-ring)` on `:focus-visible`).

---

### Badges

```html
<span class="badge">Default</span>
<span class="badge badge-success">Success</span>
<span class="badge badge-danger">Danger</span>
<span class="badge badge-warning">Warning</span>
<span class="badge badge-info">Info</span>
```

Pill-shaped labels. Use for status indicators, condition grades, tags.

---

### Typography utilities

```html
<p class="text-sm text-muted">Small muted text</p>
<span class="text-mono">const x = 42</span>
<h2 class="font-semibold tracking-tight">Heading</h2>
<p class="tabular-nums">$1,234.56</p>
```

| Class | Effect |
|---|---|
| `.text-{xs\|sm\|base\|lg\|xl\|2xl\|3xl\|4xl\|5xl}` | Font size |
| `.font-{normal\|medium\|semibold\|bold}` | Font weight |
| `.text-muted` | `var(--color-text-muted)` |
| `.text-subtle` | `var(--color-text-subtle)` |
| `.text-accent` | `var(--color-accent)` — for inline emphasis |
| `.text-mono` | Monospace font |
| `.tabular-nums` | `font-variant-numeric: tabular-nums` — for numbers in data tables |
| `.leading-{tight\|snug\|normal}` | Line height (1.2 / 1.375 / 1.6) |
| `.tracking-{tight\|normal\|wide}` | Letter spacing |
| `.truncate` | Single-line ellipsis overflow |

---

### Misc

```html
<hr class="divider">
<span class="sr-only">Screen reader only text</span>
```

---

## Typical Page Pattern

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>App name</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300..700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
</head>
<body>
  <div class="container" style="padding-top: var(--space-10); padding-bottom: var(--space-16);">

    <h1 style="font-size: var(--text-4xl); font-weight: 700; letter-spacing: -0.02em; margin-bottom: var(--space-2);">
      Page title
    </h1>
    <p style="color: var(--color-text-muted); margin-bottom: var(--space-8);">
      Supporting description.
    </p>

    <div class="card-flat" style="padding: var(--space-6);">
      <div class="form-group">
        <label class="label" for="example">Field</label>
        <input id="example" class="input" placeholder="Value" />
      </div>
      <div style="margin-top: var(--space-4); display: flex; gap: var(--space-3);">
        <button class="btn btn-primary">Save</button>
        <button class="btn btn-ghost">Cancel</button>
      </div>
    </div>

  </div>
</body>
</html>
```

---

## Design Rationale

These notes explain **why** key decisions were made. Helps Claude make correct autonomous decisions at edge cases.

- **Aesthetic direction: Precision Data** — These apps display structured data (recipes/costs, trade prices). The design should make data readable, not distract from it. Generous whitespace, one accent colour, strong typographic hierarchy.
- **Outfit font** — Geometric, modern, and distinctive — not a generic system font. High x-height, open numerals, excellent readability at small sizes. The design system deliberately avoids Inter/Roboto/Arial which are overused and indistinct.
- **JetBrains Mono** — Best-in-class monospace for technical contexts. Clear differentiation of 0/O, l/1/I. Use for any numeric data where precision matters.
- **Accent: `#0055e9`** — Vivid, saturated electric blue. Clear identity — not iOS blue (#007AFF), not a purple-leaning blue (#6366f1), not desaturated (#3b82f6 at full opacity). One colour handles all interactive elements; status colours (danger, success, warning, info) are separate.
- **4px spacing scale** — Aligns to the most common baseline grid (4px/8px). Every step is a multiple of 4, ensuring visual consistency when combining tokens.
- **Semantic colour names** — Tokens like `--color-bg` and `--color-text` instead of `--slate-900` enable dark mode via simple reassignment. Never reference the raw hex values directly in app code.
- **Max-width 1100px** — Optimised for readability at typical laptop/desktop widths. For data tables or dashboards that benefit from more width, override inline.
- **CDN-only distribution** — Apps load `ui.css` from the server, never locally. All apps update simultaneously; no version drift.
- **No CSS framework dependency** — The design system is intentionally self-contained. Tailwind or Bootstrap creates specificity conflicts and bloat. Exception: Next.js apps may use Tailwind utilities for layout (flex, grid, gap) only — never for colours, typography, or component styling that the design system already covers.
