# COPILOT.md - Ruby API Pack ActiveCampaign

## Role

GitHub Copilot is a support assistant for local development in this repository.
It may help with Ruby, RSpec, documentation, and small refactors, but it does
not own architecture, release decisions, or final handoff authority.

## Repository Conventions

- Keep HTTParty calls centralized in the connection wrapper.
- Keep ActiveCampaign credentials configurable.
- Add focused RSpec coverage for behavior changes.
- Keep README and changelog aligned with public usage.
- Do not create commits unless explicitly asked.

## Validation

Run these before handing off non-trivial changes:

```bash
bundle exec rspec
bundle exec rubocop
```

## Security

Never suggest adding real ActiveCampaign API tokens, production account URLs,
contact data, request payloads, or sensitive response bodies to source control.
