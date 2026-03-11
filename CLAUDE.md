# design-system

Design system reference and Claude Code skills for charliejmwilliams.com.

## Source of truth

The canonical tokens and components are in @STYLE_GUIDE.md.
The live stylesheet at `https://charliejmwilliams.com/ui.css` must match STYLE_GUIDE.md.

## Rules for editing skills

- Skills live in `skills/<name>/SKILL.md`. Each must have YAML frontmatter with `description` and `disable-model-invocation: true`.
- Every skill that involves UI work must fetch the style guide at runtime:
  `https://raw.githubusercontent.com/charliams/design-system/main/STYLE_GUIDE.md`
- Do not embed token values into skill files — fetch at runtime so skills stay in sync.
- Skills are imperative, numbered steps. Assume no prior context from the user.
- Use `$ARGUMENTS` for user-provided inputs (project path, project name, etc.).

## Rules for editing the style guide

- Do not rename tokens or component classes without explicit user instruction.
- If you change STYLE_GUIDE.md, note that `ui.css` needs separate deployment on the server.

## Constraints

- Never add Tailwind, Bootstrap, or any third-party CSS framework to any project using this design system.
- Never hardcode colour hex values — always use CSS custom properties.
- The stylesheet URL is `https://charliejmwilliams.com/ui.css` — do not use any other URL.
- No CSS Modules, styled-components, or CSS-in-JS in consuming projects. Use design system classes directly.

## After editing skills

Run `./install.sh` (macOS/Linux) or `.\install.ps1` (Windows) to deploy to `~/.claude/skills/`.
