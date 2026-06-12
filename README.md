# Ruby API Pack ActiveCampaign

## Repository Snapshot

| Field | Value |
|-------|-------|
| Project team | `project-ruby` |
| Repository role | ActiveCampaign API client |
| Package/artifact | `ruby_api_pack_active_campaign` |
| Current version/status | 0.1.0 |

## Standard Workflow

1. Read [AGENTS.md](AGENTS.md), then the agent-specific guide for the task.
2. Check [TODO.md](TODO.md) and [ROADMAP.md](ROADMAP.md) for current scope.
3. Make the smallest repo-local change that satisfies the task.
4. Run `bundle exec rspec`, `bundle exec rubocop`, and
   `gem build ruby_api_pack_active_campaign.gemspec` when validation is
   required or practical.
5. Update docs and changelog history only when behavior, public contracts, or
   release-relevant metadata changed.

## Documentation Map

| Guide | Path |
|-------|------|
| Agent rules | [AGENTS.md](AGENTS.md) |
| Claude Code | [CLAUDE.md](CLAUDE.md) |
| Codex | [CODEX.md](CODEX.md) |
| Copilot | [COPILOT.md](COPILOT.md) |
| Jules | [JULES.md](JULES.md) |
| Roadmap | [ROADMAP.md](ROADMAP.md) |
| Todo | [TODO.md](TODO.md) |
| Changelog | [CHANGELOG.md](CHANGELOG.md) |
| Security | [SECURITY.md](SECURITY.md) |
| Code of Conduct | [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) |
| Contributing | [CONTRIBUTING.md](CONTRIBUTING.md) |

[![Gem Version](https://img.shields.io/gem/v/ruby_api_pack_active_campaign.svg)](https://rubygems.org/gems/ruby_api_pack_active_campaign)
[![RSpec](https://github.com/phcdevworks/ruby_api_pack_active_campaign/actions/workflows/test.yml/badge.svg)](https://github.com/phcdevworks/ruby_api_pack_active_campaign/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/phcdevworks/ruby_api_pack_active_campaign/graph/badge.svg?token=QatALQbsJ5)](https://codecov.io/gh/phcdevworks/ruby_api_pack_active_campaign)
[![License](https://img.shields.io/github/license/phcdevworks/ruby_api_pack_active_campaign.svg)](MIT-LICENSE)

`ruby_api_pack_active_campaign` is a Ruby client gem for the ActiveCampaign API.
It centralizes ActiveCampaign configuration, HTTP connection handling, response
parsing, and contact-oriented API helpers so Ruby and Rails applications can
consume ActiveCampaign without duplicating low-level request code.

[Contributing](CONTRIBUTING.md) | [Code of Conduct](CODE_OF_CONDUCT.md) |
[Changelog](CHANGELOG.md) | [Roadmap](ROADMAP.md) |
[Security Policy](SECURITY.md) | [AI Guide](AGENTS.md)

## Source of Truth

The gem's public behavior is defined by its configuration object, connection
wrapper, contact API helpers, and specs. Keep those surfaces aligned whenever an
ActiveCampaign endpoint or request shape changes.

| Layer | Path | Rule |
| --- | --- | --- |
| Gem entry point | `lib/ruby_api_pack_active_campaign.rb` | Loads configuration, connection, and API helper surfaces |
| Configuration | `lib/ruby_api_pack_active_campaign/configuration.rb` | Owns ActiveCampaign base URL and API token settings |
| Connection wrapper | `lib/ruby_api_pack_active_campaign/connection/ac_connect.rb` | Centralizes HTTParty requests, headers, JSON parsing, and API errors |
| Contact API helpers | `lib/ruby_api_pack_active_campaign/api/ac_contacts.rb` | Public contact, automation, import, activity, note, and related-resource helpers |
| Version | `lib/ruby_api_pack_active_campaign/version.rb` | Gem release version |
| Specs | `spec/` | Contract and regression coverage for configuration, connection, and API helpers |

After behavior changes, run:

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_active_campaign.gemspec
```

## What This Gem Owns

- ActiveCampaign API configuration through `RubyApiPackActiveCampaign.configure`
- HTTParty-based GET, POST, PUT, and DELETE request helpers
- ActiveCampaign contact helper methods under
  `RubyApiPackActiveCampaign::Api::AcContacts`
- JSON response parsing and raised errors for unsuccessful API responses
- RSpec coverage for connection behavior and API helper delegation

## What This Gem Does Not Own

- ActiveCampaign account setup, billing, lists, automations, or dashboard
  configuration
- Host application models, persistence, background jobs, or authorization
- User-facing Rails controllers or UI components
- Storage of production credentials or API tokens
- A complete wrapper for every ActiveCampaign endpoint

## Installation

Add the gem to your application's Gemfile:

```ruby
gem "ruby_api_pack_active_campaign"
```

Install dependencies:

```bash
bundle install
```

Or install the gem directly:

```bash
gem install ruby_api_pack_active_campaign
```

## Configuration

Configure the ActiveCampaign API URL and token before calling API helpers. In a
Rails application, this typically belongs in an initializer.

```ruby
# config/initializers/ruby_api_pack_active_campaign.rb
RubyApiPackActiveCampaign.configure do |config|
  config.ac_api_url = ENV.fetch("AC_API_URL")
  config.ac_api_token = ENV.fetch("AC_API_TOKEN")
end
```

`ac_api_url` should include the API version path, for example:

```text
https://youraccountname.api-us1.com/api/3
```

Do not commit real ActiveCampaign API tokens. Use Rails credentials, encrypted
environment management, or your deployment platform's secret manager.

## Contact Usage

Require the gem and call contact helpers through
`RubyApiPackActiveCampaign::Api::AcContacts`.

```ruby
require "ruby_api_pack_active_campaign"

RubyApiPackActiveCampaign.configure do |config|
  config.ac_api_url = ENV.fetch("AC_API_URL")
  config.ac_api_token = ENV.fetch("AC_API_TOKEN")
end

contacts = RubyApiPackActiveCampaign::Api::AcContacts.contact_list
contact = RubyApiPackActiveCampaign::Api::AcContacts.contact_by_id(123)
```

Create or sync contacts by passing request bodies that match ActiveCampaign's
API contract:

```ruby
RubyApiPackActiveCampaign::Api::AcContacts.create_contact(
  contact: {
    email: "jane@example.com",
    firstName: "Jane",
    lastName: "Example"
  }
)

RubyApiPackActiveCampaign::Api::AcContacts.sync_contact(
  contact: {
    email: "jane@example.com",
    firstName: "Jane"
  }
)
```

## Public API Helpers

The current public helper surface is contact-focused:

| Method | ActiveCampaign path |
| --- | --- |
| `contact_list` | `GET /contacts` |
| `contact_by_id(contact_id)` | `GET /contacts/:contact_id` |
| `create_contact(contact_params)` | `POST /contacts` |
| `sync_contact(contact_params)` | `POST /contact/sync` |
| `update_contact(contact_id, contact_params)` | `PUT /contacts/:contact_id` |
| `delete_contact(contact_id)` | `DELETE /contacts/:contact_id` |
| `update_contact_list_status(contact_list_params)` | `POST /contactLists` |
| `list_automations(contact_id)` | `GET /contacts/:contact_id/contactAutomations` |
| `retrieve_contact_score(contact_id)` | `GET /contacts/:contact_id/scoreValues` |
| `bulk_import_contacts(import_params)` | `POST /import/bulk_import` |
| `bulk_import_status_list` | `GET /import/bulk_import` |
| `bulk_import_status_info` | `GET /import/info` |
| `list_contact_activities` | `GET /activities` |
| `retrieve_bounce_logs(contact_id)` | `GET /contacts/:contact_id/bounceLogs` |
| `retrieve_contact_data(contact_id)` | `GET /contacts/:contact_id/contactData` |
| `retrieve_contact_goals(contact_id)` | `GET /contacts/:contact_id/contactGoals` |
| `retrieve_contact_list_memberships(contact_id)` | `GET /contacts/:contact_id/contactLists` |
| `retrieve_contact_logs(contact_id)` | `GET /contacts/:contact_id/contactLogs` |
| `retrieve_contact_deals(contact_id)` | `GET /contacts/:contact_id/deals` |
| `retrieve_contact_field_values(contact_id)` | `GET /contacts/:contact_id/fieldValues` |
| `retrieve_contact_geo_ips(contact_id)` | `GET /contacts/:contact_id/geoIps` |
| `retrieve_geo_ip_address(geo_address_id)` | `GET /geoIps/:geo_address_id/geoAddress` |
| `retrieve_contact_notes(contact_id)` | `GET /contacts/:contact_id/notes` |
| `list_all_notes` | `GET /notes` |
| `retrieve_contact_organization(contact_id)` | `GET /contacts/:contact_id/organization` |
| `retrieve_contact_plus_append(contact_id)` | `GET /contacts/:contact_id/plusAppend` |
| `retrieve_tracking_logs(contact_id)` | `GET /contacts/:contact_id/trackingLogs` |
| `retrieve_account_contacts(contact_id)` | `GET /contacts/:contact_id/accountContacts` |
| `retrieve_automation_entry_counts(contact_id)` | `GET /contacts/:contact_id/automationEntryCounts` |

## Error Handling

Successful responses are parsed from JSON and returned as Ruby hashes. Non-2xx
responses raise an error with the HTTP status and response body. Invalid JSON
responses raise a parsing error.

Handle these errors at your application boundary so API failures do not expose
tokens, request bodies, or sensitive contact data in logs.

## Development

Install dependencies:

```bash
bundle install
```

Run the test suite:

```bash
bundle exec rspec
```

Run style checks:

```bash
bundle exec rubocop
```

Build the gem locally:

```bash
gem build ruby_api_pack_active_campaign.gemspec
```

## Documentation and AI Guides

This repository follows the PHCDevworks documentation model used across the
Spectre and Rails/Ruby workspaces:

- `AGENTS.md` defines shared AI boundaries.
- `CLAUDE.md`, `CODEX.md`, `COPILOT.md`, and `JULES.md` define agent-specific
  working rules.
- `.github/copilot-instructions.md` and `.github/codex-instructions.md` provide
  GitHub-integrated assistant guidance.
- `CHANGELOG.md`, `ROADMAP.md`, and `TODO.md` keep release and planning context
  visible.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for setup, coding standards, pull
request expectations, and release hygiene.

## Security

Please do not report vulnerabilities through public issues. Follow
[SECURITY.md](SECURITY.md) for responsible disclosure.

## License

The gem is available as open source under the terms of the
[MIT License](MIT-LICENSE).
