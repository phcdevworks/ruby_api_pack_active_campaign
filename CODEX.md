# CODEX.md - Ruby API Pack ActiveCampaign

## Role

Codex owns documentation standardization, release readiness, repo hygiene,
production stabilization, and configuration consistency for this Ruby gem.
Claude Code leads implementation changes. Codex has commit, push, and tag
authority for its own scope of work, including cutting the release itself
(see "Release Mechanics" below). `gem push` (RubyGems publish) and merge
decisions stay with Bradley Potts.

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

Run the validation gate described in [AGENTS.md](AGENTS.md), plus:

```bash
gem build ruby_api_pack_active_campaign.gemspec
```

## Release Mechanics

1. Update `lib/ruby_api_pack_active_campaign/version.rb` to the new version.
2. Move `[Unreleased]` notes in `CHANGELOG.md` into a new versioned entry:
   `## [<version>] - <YYYY-MM-DD>`, with a release title line in the format
   `**Release Title:** <short title>`, where `<short title>` is a concise
   summary of what shipped.
3. Run the validation gate described in [AGENTS.md](AGENTS.md) plus
   `gem build ruby_api_pack_active_campaign.gemspec` — must pass clean.
4. Stage and commit the version bump and changelog update.
5. Create the git tag: `git tag v<version>` (matching `version.rb` exactly),
   then push the commit and tag.
6. Publish the GitHub Release from that tag: `gh release create v<version>
   --title "v<version>: <short title>" --notes-file` (extract the
   new version's changelog section, or `--notes` inline for a short release).
7. `gem push` is **not** run by Codex — that stays with Bradley Potts.

## Hard Limits

- Commit, tag, and GitHub Release authority is granted per "Release
  Mechanics" above; do not run `gem push` or merge PRs unless explicitly
  asked.
- Do not overwrite unrelated local changes.
- Do not add real credentials, ActiveCampaign API tokens, production account
  URLs, contact data, or sensitive payloads to documentation or tests.
