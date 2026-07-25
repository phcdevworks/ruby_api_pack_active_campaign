# GitHub Copilot Instructions for ruby_api_pack_active_campaign

## Role

GitHub Copilot is the general development support assistant for this Ruby
gem — editing, refactors, tests, and Ruby productivity inside the IDE.
Copilot does not own architecture direction, release decisions, or final
handoff authority. Full roster and authority table:
[AGENTS.md](../AGENTS.md).

## Package Conventions

- Keep HTTParty calls centralized in the connection wrapper.
- Keep ActiveCampaign credentials configurable.
- Add focused RSpec coverage for connection and API helper behavior changes.
- Keep README and changelog aligned with public usage.

## Working Style

- Prefer narrow, pattern-aligned changes.
- Keep docs and specs in sync when behavior changes.
- Preserve unrelated local changes.
- Copilot has commit, push, and tag authority per the companywide grant, scoped to this work.

## Validation

- Run `bundle exec rspec` for behavior changes.
- Run `bundle exec rubocop` before handoff.
- Build the gem when release packaging changes.

## Security

Never add real ActiveCampaign API tokens, production account URLs, contact data,
request payloads, or sensitive response bodies to source control.

## Pull Request Creation

When opening a PR, populate every section of the repo's PR template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change classification - additive, behavior change, breaking, or docs/config only
- Checklist - completed items checked; blocked items left unchecked with a brief note

Never submit a PR with an empty body or only template headings.

## References

- Shared boundaries: `AGENTS.md`
- Lead implementation rules: `CLAUDE.md`
- Codex/release readiness rules: `CODEX.md`
- Copilot support context: `COPILOT.md`
