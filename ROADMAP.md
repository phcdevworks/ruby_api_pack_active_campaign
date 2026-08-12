# Roadmap

`ruby_api_pack_active_campaign` is a Ruby client gem for the ActiveCampaign
API, built on `ruby_api_pack_core` for shared HTTP client and response
handling. Its job is to expose a stable, well-tested contact helper surface —
not to own generic HTTP plumbing or host-application concerns.

This document tracks what's next. For what already shipped and why, see
[CHANGELOG.md](CHANGELOG.md) (release-by-release detail) and git history —
this file does not restate delivered work.

---

## Delivered Phases

| Phase | Summary | Shipped in |
| --- | --- | --- |
| 1 | Contact helper surface — full `AcContacts` API covering CRUD, sync, automations, scoring, notes, deals, imports, activity, and tracking endpoints | 0.1.0 |
| 2 | Configuration and connection foundation — `RubyApiPackActiveCampaign.configure`, `Connection::AcConnect` on `ruby_api_pack_core`'s `Connection::Base` | 0.1.0 |
| 3 | Documentation baseline — standardized README, AI operating guides, community health docs, changelog, roadmap | 0.1.0 |
| 4 | Dependency and tooling currency — `ruby_api_pack_core` pinned to latest published `0.1.0`, dev dependencies (bundler, rubocop, simplecov, rake, rspec) raised to latest published versions | Unreleased |
| 5 | Release hygiene — removed stray CI workflow scaffold, aligned `required_ruby_version` with the CI matrix, removed unused `Oj` dependency from `lib/` | 0.2.0 |

---

## What's Next

No active phase is currently open. Further work opens on demand, driven by
concrete consumer needs rather than a standing backlog — see
[TODO.md](TODO.md). Candidates when demand arises:

- Rails initializer and contact-payload usage examples in the README.
- Pagination and rate-limit guidance for list/activity endpoints.
- A typed error class for API failures, layered on
  `ruby_api_pack_core`'s response validator.
- Request timeout configuration, coordinated with `ruby_api_pack_core` if the
  behavior belongs in the shared connection base.

## Explicitly Out of Scope

- Generic HTTP request/response handling — belongs in `ruby_api_pack_core`.
- ActiveCampaign dashboard administration.
- Host application data models or persistence.
- User-facing Rails controllers or views.
- Application-specific marketing automation workflows.
- Storage or management of production secrets.
