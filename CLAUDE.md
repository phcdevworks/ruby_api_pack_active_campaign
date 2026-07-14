# CLAUDE.md - Ruby API Pack ActiveCampaign

## Project Identity

**Gem:** `ruby_api_pack_active_campaign`
**Owner:** PHCDevworks
**Primary implementation agent:** Claude Code

This repository is a Ruby gem that wraps ActiveCampaign API calls for
PHCDevworks applications. This file is the implementation guide for Claude Code.
Read `AGENTS.md` first for shared agent boundaries.

This gem depends on `ruby_api_pack_core` for its connection wrapper base class
(`RubyApiPackCore::Connection::Base`), response validator
(`RubyApiPackCore::Handlers::ResponseValidator`), and configuration mixin
(`RubyApiPackCore::Configurable`). Shared HTTP plumbing belongs upstream in
`ruby_api_pack_core`, not duplicated here — see that repo's own `CLAUDE.md`
before changing anything that looks like generic request/response handling.

## Commit Policy

Claude Code does not create commits in this repository unless explicitly asked.
Prepare changes, run validation, and leave commit, tag, push, and release
authority to the human maintainer.

## Development Workflow

Run `bundle install`, then the validation gate described in
[AGENTS.md](AGENTS.md).

## Ruby Gem Contract

The public behavior surface is:

- `lib/ruby_api_pack_active_campaign.rb`
- `lib/ruby_api_pack_active_campaign/configuration.rb`
- `lib/ruby_api_pack_active_campaign/connection/ac_connect.rb`
- `lib/ruby_api_pack_active_campaign/api/ac_contacts.rb`
- `README.md`

Configuration, connection, API helper, and response behavior changes require
matching specs and a changelog entry.

## Implementation Rules

1. Keep HTTParty calls inside the connection wrapper, which subclasses
   `RubyApiPackCore::Connection::Base` — implement only `#auth_headers` there,
   do not reimplement URL building, status handling, or JSON parsing locally.
2. Keep API URL and token assumptions configurable through
   `RubyApiPackActiveCampaign.configure`.
3. Preserve helper method names unless the change is intentionally breaking.
4. Keep request payloads aligned with ActiveCampaign's documented API shapes.
5. Avoid broad refactors unless they directly support the requested change.
6. Do not expose API tokens, production account URLs, contact data, request
   payloads, or sensitive response bodies in logs, fixtures, docs, or test
   output.
7. If a change requires modifying shared HTTP behavior (URL building, status
   handling, JSON parsing, response validation, or the `configure` pattern),
   make that change in `ruby_api_pack_core` instead, and coordinate the
   version bump here.

## Testing Expectations

- Configuration changes need direct configuration specs.
- Connection changes need specs for HTTP verb, headers, body, response parsing,
  and error behavior.
- API helper changes need delegation specs that verify endpoint path, verb, and
  payload handling.
- Security-sensitive changes should include both success and failure coverage.

## Documentation Expectations

Update:

- `README.md` for public installation, configuration, endpoint, or usage
  changes.
- `CHANGELOG.md` for every behavior-impacting change.
- `SECURITY.md` when security reporting or guidance changes.
- AI docs when agent workflows or authority boundaries change.

## Release Procedure

1. Update `lib/ruby_api_pack_active_campaign/version.rb`.
2. Move changelog notes from `[Unreleased]` into a dated version section.
3. Run the validation gate described in [AGENTS.md](AGENTS.md).
4. Build and publish only when the maintainer explicitly approves.
