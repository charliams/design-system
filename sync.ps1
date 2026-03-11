# sync.ps1 — Sync design-system Claude Code skills to ~/.claude/commands/
# Run after `git pull` to update skills on this machine: .\sync.ps1
# Identical in effect to install.ps1 — named separately for clarity in the update workflow.

& (Join-Path $PSScriptRoot "install.ps1")
