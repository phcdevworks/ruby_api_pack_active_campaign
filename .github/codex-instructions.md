# Codex Instructions - Ruby API Pack ActiveCampaign

This file is the GitHub-integrated Codex guide for
`ruby_api_pack_active_campaign`. Read `CODEX.md` at the repo root for the full
operational playbook and `AGENTS.md` for shared AI boundaries.

## Role Summary

Codex owns documentation, release readiness, production stabilization, repo
hygiene, and configuration standardization. Claude Code leads implementation.
Human maintainers own final commit, merge, tag, publish, and release decisions.

## Pull Request Creation

When opening a PR, Codex must populate every section of
`.github/pull_request_template.md`:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change type - one of `additive`, `behavior change`, `breaking`, or
  `docs/config only`
- Checklist - check completed items and leave blocked items unchecked with a
  short note

Never submit a PR with an empty body or only template headings.

## Pull Request Review Scope

When reviewing a PR, Codex checks:

1. Configuration, connection, and API helper behavior drift.
2. Missing specs for ActiveCampaign helper changes.
3. API tokens, production account URLs, contact data, request payloads, or
   sensitive response bodies exposed in docs, logs, fixtures, or examples.
4. Inconsistent response parsing or error behavior.
5. README or changelog drift from public behavior.
6. CI and release workflow mismatch with documented commands.

## Validation Commands

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_active_campaign.gemspec
```

## Source of Truth Hierarchy

When guidance conflicts, resolve in this order:

1. `lib/ruby_api_pack_active_campaign/configuration.rb`
2. `lib/ruby_api_pack_active_campaign/connection/ac_connect.rb`
3. `lib/ruby_api_pack_active_campaign/api/ac_contacts.rb`
4. `AGENTS.md`
5. `README.md`

## Hard Limits

- Never publish the gem unless explicitly asked.
- Never create commits, tags, or releases unless explicitly asked.
- Never overwrite unrelated local changes.
- Never add real credentials or sensitive ActiveCampaign data.
