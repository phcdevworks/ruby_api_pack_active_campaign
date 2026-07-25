# CODEX.md - Ruby API Pack ActiveCampaign

## Role

Codex owns documentation standardization, release readiness, repo hygiene,
production stabilization, and configuration consistency for this Ruby gem.
Claude Code leads implementation changes. Human maintainers own final commit,
merge, tag, publish, and release decisions.

## Default Workflow

1. Inspect the current working tree and preserve unrelated local changes.
2. Read the relevant source, specs, and docs before editing.
3. Make focused changes using existing Ruby and RSpec patterns.
4. Update README, changelog, and AI docs when public guidance changes.
5. Run the validation gate described in [AGENTS.md](AGENTS.md) when feasible.
6. Report any validation that could not be run.

## Documentation Scope

Codex may update:

- `README.md`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `CODE_OF_CONDUCT.md`
- `CHANGELOG.md`
- `ROADMAP.md`
- `TODO.md`
- `AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `COPILOT.md`, `JULES.md`
- `.github/` templates and assistant instructions
- `.codex/` workspace notes

## Review Scope

When reviewing changes, Codex checks:

1. Configuration, connection, and API helper behavior drift.
2. Missing RSpec coverage for ActiveCampaign helper changes.
3. ActiveCampaign API tokens, production account URLs, contact data, request
   payloads, or sensitive response bodies exposed in docs, logs, fixtures, or
   examples.
4. Inconsistent response parsing or error behavior.
5. README or changelog drift from the public behavior surface.
6. CI and release workflow mismatch with documented commands.

## Validation Commands

Run the validation gate described in [AGENTS.md](AGENTS.md).

## Hard Limits

- Do not publish the gem unless explicitly asked.
- Codex has commit, push, and tag authority for its own scope of work; do not publish the gem or cut releases unless explicitly asked.
- Do not overwrite unrelated local changes.
- Do not add real credentials, ActiveCampaign API tokens, production account
  URLs, contact data, or sensitive payloads to documentation or tests.
