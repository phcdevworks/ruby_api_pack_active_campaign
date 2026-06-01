# Codex Workspace Notes

This folder keeps Codex-facing operational notes for
`ruby_api_pack_active_campaign`.

## Default Checks

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_active_campaign.gemspec
```

## Documentation Standard

Keep these files synchronized:

- `README.md`
- `CONTRIBUTING.md`
- `CHANGELOG.md`
- `ROADMAP.md`
- `TODO.md`
- `AGENTS.md`
- `CODEX.md`
- `.github/codex-instructions.md`

## Security Reminder

Do not include real ActiveCampaign API tokens, production account URLs, contact
data, request payloads, or sensitive response bodies in docs, specs, logs, or
examples.
