# Style Guide — charliejmwilliams.com Design System

Include the shared stylesheet in any app with a single line:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

---

## Design Tokens

All tokens are CSS custom properties on `:root`. Use them with `var(--token-name)`.

### Colours

| Token | Value | Usage |
|---|---|---|
| `--color-bg` | `#ffffff` | Page background |
| `--color-surface` | `#f9fafb` | Subtle surface (e.g. card-flat, inputs) |
| `--color-surface-2` | `#f3f4f6` | Deeper surface layer |
| `--color-border` | `#e5e7eb` | Default borders |
| `--color-border-hover` | `#d1d5db` | Border on hover |
| `--color-text` | `#111827` | Primary text |
| `--color-text-muted` | `#6b7280` | Secondary / supporting text |
| `--color-text-subtle` | `#9ca3af` | Placeholder / de-emphasised text |
| `--color-accent` | `#111827` | Primary action colour |
| `--color-accent-hover` | `#374151` | Primary action hover |
| `--color-danger` | `#dc2626` | Destructive actions / errors |
| `--color-danger-hover` | `#b91c1c` | Danger hover |
| `--color-success` | `#16a34a` | Success states |

### Typography

| Token | Value |
|---|---|
| `--font-sans` | Inter, system-ui, -apple-system, … |
| `--font-mono` | JetBrains Mono, Fira Code, Cascadia Code, … |

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
- **Body** — `--text-base`, line-height 1.6
- **Small / muted** — `--text-sm`, `color: var(--color-text-muted)`

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

| Token | Usage |
|---|---|
| `--shadow-xs` | Barely-there lift |
| `--shadow-sm` | Default card shadow |
| `--shadow-md` | Hovered card / popover |
| `--shadow-lg` | Modals / drawers |

### Transitions

| Token | Value |
|---|---|
| `--transition` | 150ms cubic-bezier(0.4, 0, 0.2, 1) |
| `--transition-slow` | 300ms cubic-bezier(0.4, 0, 0.2, 1) |

---

## Component Classes

### Layout

```html
<div class="container">…</div>
```
Max-width 1100px, centred, with horizontal padding. Responsive (padding reduces on mobile).

---

### Cards

```html
<!-- Hoverable card — use for clickable surfaces -->
<div class="card">…</div>

<!-- Flat card — use for forms, panels, code blocks -->
<div class="card-flat">…</div>
```

`.card` lifts on hover (`translateY(-2px)`, `--shadow-md`). `.card-flat` is static.

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
| `.btn` | Base — always required |
| `.btn-primary` | Filled black, white text — main CTA |
| `.btn-ghost` | Transparent with border — secondary action |
| `.btn-danger` | Red text, transparent — destructive action |
| `.btn-sm` | 28px min-height, `--text-xs` |
| `.btn-lg` | 44px min-height, `--text-base` |

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

`.input`, `.select`, `.textarea` all share the same sizing and focus ring (3px accent shadow on focus).

---

### Badges

```html
<span class="badge">Default</span>
<span class="badge badge-success">Success</span>
<span class="badge badge-danger">Danger</span>
```

Pill-shaped labels. Use for status indicators.

---

### Typography utilities

```html
<p class="text-sm text-muted">Small muted text</p>
<span class="text-mono">const x = 42</span>
<h2 class="font-semibold tracking-tight">Heading</h2>
```

| Class | Effect |
|---|---|
| `.text-{xs\|sm\|base\|lg\|xl\|2xl\|3xl\|4xl\|5xl}` | Font size |
| `.font-{normal\|medium\|semibold\|bold}` | Font weight |
| `.text-muted` | `color-text-muted` |
| `.text-subtle` | `color-text-subtle` |
| `.text-mono` | Monospace font |
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

    <div class="card-flat">
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
