# design-system

Charlie's personal design system and Claude Code skills store.

The design system powers all apps at `charliejmwilliams.com`. This repo serves two purposes:

1. **Style reference** — `STYLE_GUIDE.md` is the canonical source for all CSS tokens and component classes.
2. **Skills store** — `commands/` holds Claude Code slash commands synced to `~/.claude/commands/` on any machine.

---

## Using the design system

Add this to every project's `<head>`:

```html
<link rel="stylesheet" href="https://charliejmwilliams.com/ui.css">
```

Never download or bundle `ui.css` locally — always load from CDN.

**Rules for any UI code:**

1. Link to `charliejmwilliams.com/ui.css` externally — do not copy it locally.
2. Use CSS custom properties for colours, spacing, and typography — no hardcoded hex values.
3. Use component classes (`.btn`, `.card`, `.card-flat`, `.input`, `.badge`) — don't write custom equivalents.
4. When migrating CSS: replace hardcoded values with tokens/classes, then delete the redundant rules.

See [`STYLE_GUIDE.md`](./STYLE_GUIDE.md) for the full token reference and component class documentation.

---

## Claude Code skills

Three slash commands are available once installed:

| Command | What it does |
|---------|-------------|
| `/ds-migrate` | Migrates an existing app's UI to the design system (tokens, classes, removes redundant CSS) |
| `/ds-new-webapp` | Architects and scaffolds a new Static HTML / Flask / Next.js app using the design system |
| `/ds-setup` | Adds the stylesheet link and design system rules to any existing project's `CLAUDE.md` |

### Install (first time on a new machine)

```powershell
git clone https://github.com/charliams/design-system "$env:USERPROFILE\design-system"
cd "$env:USERPROFILE\design-system"
.\install.ps1
```

### Update (after `git pull`)

```powershell
git pull
.\sync.ps1
```

Skills are copied to `~/.claude/commands/` and are immediately available in all Claude Code sessions.
