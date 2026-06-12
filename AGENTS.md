# Ruby API Pack ActiveCampaign Agent Guide

## Repository Snapshot

| Field | Value |
|-------|-------|
| Project team | `project-ruby` |
| Repository role | ActiveCampaign API client |
| Package/artifact | `ruby_api_pack_active_campaign` |
| Validation gate | `bundle exec rspec` + `bundle exec rubocop` + `gem build ruby_api_pack_active_campaign.gemspec` |

## Standard Authority Model

| Agent | Role | Authority |
|-------|------|-----------|
| Claude Code | Lead implementation and validation | [CLAUDE.md](CLAUDE.md) |
| OpenAI Codex | Documentation, release readiness, stabilization, and repo hygiene | [CODEX.md](CODEX.md) |
| ChatGPT | Strategy, coordination, prompt design, and external review | Support only |
| GitHub Copilot | Development assistance | [COPILOT.md](COPILOT.md) |
| Google Jules | Bounded automated maintenance | [JULES.md](JULES.md) |

Bradley Potts holds final authority for commits, merges, tags, publishing, and
releases.

## Standard Handoff

Every AI-prepared change should report files changed, validation performed,
public behavior or contract impact, and unresolved risks. Do not edit generated
outputs directly. Do not update [CHANGELOG.md](CHANGELOG.md) unless the change
is release-relevant.

This repository is maintained by PHCDevworks and contains the
`ruby_api_pack_active_campaign` Ruby gem for ActiveCampaign API helpers.

## Shared Source Rules

| Path | Status | Notes |
| --- | --- | --- |
| `lib/ruby_api_pack_active_campaign.rb` | May edit carefully | Public gem entry point |
| `lib/ruby_api_pack_active_campaign/configuration.rb` | May edit carefully | Public configuration hooks |
| `lib/ruby_api_pack_active_campaign/connection/` | May edit | Centralized HTTP behavior |
| `lib/ruby_api_pack_active_campaign/api/` | May edit | Public ActiveCampaign helper surface |
| `lib/ruby_api_pack_active_campaign/version.rb` | May edit for releases | Gem version authority |
| `spec/` | May edit | Required for behavior changes |
| `README.md`, `CHANGELOG.md`, docs | May edit | Keep public guidance synchronized |
| Credentials, secrets, tokens, production contact data | Never commit | Do not expose ActiveCampaign credentials or customer data |

Full validation command:

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_active_campaign.gemspec
```

## Core Rules

1. Treat configuration, connection behavior, API helpers, and specs as the
   public behavior contract.
2. Keep ActiveCampaign credentials behind configuration hooks.
3. Do not log or document live API tokens, production account URLs, contact
   data, request payloads, or response bodies containing sensitive data.
4. Keep HTTParty access centralized through the connection wrapper.
5. Update README and changelog when public usage changes.
6. Add focused tests for changed API helper behavior.
7. Preserve unrelated local changes.

## Agent-Specific Guides

- `CLAUDE.md` - primary implementation workflow.
- `CODEX.md` - documentation, release readiness, and stabilization workflow.
- `COPILOT.md` and `.github/copilot-instructions.md` - IDE support workflow.
- `JULES.md` - bounded automated maintenance workflow.

## Pull Request Creation

Every agent that opens a PR must populate every section of the repository PR
template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change type - additive, behavior change, breaking, or docs/config only
- Checklist - completed items checked; blocked items left unchecked with a note

Never submit a PR with an empty body or only template headings.
