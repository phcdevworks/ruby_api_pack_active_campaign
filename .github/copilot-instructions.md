# GitHub Copilot Instructions for ruby_api_pack_active_campaign

## Role

GitHub Copilot is the general development support assistant for this Ruby gem.

- Claude Code owns implementation leadership (`CLAUDE.md`).
- Codex owns documentation, release readiness, repo hygiene, and stabilization
  (`CODEX.md`).
- Jules owns bounded automated maintenance (`JULES.md`).
- Copilot supports editing, refactors, tests, and Ruby productivity inside the
  IDE.

Copilot does not own architecture direction, release decisions, or final handoff
authority.

## Package Conventions

- Keep HTTParty calls centralized in the connection wrapper.
- Keep ActiveCampaign credentials configurable.
- Add focused RSpec coverage for connection and API helper behavior changes.
- Keep README and changelog aligned with public usage.
- Do not create commits unless explicitly asked.

## Security

Never add real ActiveCampaign API tokens, production account URLs, contact data,
request payloads, or sensitive response bodies to source control.

## Validation

```bash
bundle exec rspec
bundle exec rubocop
```

## References

- Shared boundaries: `AGENTS.md`
- Lead implementation rules: `CLAUDE.md`
- Codex/release readiness rules: `CODEX.md`
- Copilot support context: `COPILOT.md`
