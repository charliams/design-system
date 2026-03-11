# design-system

This is the charliejmwilliams.com design system repository and Claude Code skills store.

## Repository structure

| Path | Purpose |
|------|---------|
| `STYLE_GUIDE.md` | Canonical token and component reference — the source of truth |
| `commands/` | Claude Code user-level skills, synced to `~/.claude/commands/` |
| `commands/ds-migrate.md` | Skill: migrate an existing app to the design system |
| `commands/ds-new-webapp.md` | Skill: architect a new webapp from scratch |
| `commands/ds-setup.md` | Skill: add design system to an existing project's CLAUDE.md |
| `install.ps1` | Run once on a new machine to install skills |
| `sync.ps1` | Run after `git pull` to update installed skills |
| `README.md` | Human-readable documentation for GitHub |

## Rules when editing skill files

- Skill files in `commands/` are prompts that Claude Code executes. Write them as clear, numbered, imperative steps.
- Every skill that involves UI work must include a step that fetches the style guide at runtime:
  `https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md`
- Skills should be self-contained: assume no prior context from the user beyond what they typed.
- Do not embed large chunks of the style guide into skill files — fetch at runtime so skills stay in sync automatically.

## Rules when editing the style guide

- `STYLE_GUIDE.md` is the source of truth for tokens and components.
- The live stylesheet at `https://charliejmwilliams.com/ui.css` must match `STYLE_GUIDE.md`.
- If you add or change tokens or components in `STYLE_GUIDE.md`, note that `ui.css` will need to be updated separately on the server.
- Do not modify token values or component class names without explicit instruction from the user.

## After editing skills

Run `.\sync.ps1` to deploy updated skill files to `~/.claude/commands/` on this machine.
