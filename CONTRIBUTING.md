# Contributing to Ruby API Pack ActiveCampaign

Thanks for helping improve `ruby_api_pack_active_campaign`. This gem is
maintained by PHCDevworks as a Ruby client for ActiveCampaign API helpers.

## Development Setup

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Configure test credentials with non-production values when needed:

```bash
export AC_API_URL="https://youraccountname.api-us1.com/api/3"
export AC_API_TOKEN="test-token"
```

4. Run `bundle exec rspec`.
5. Run `bundle exec rubocop`.
6. Build the gem with `gem build ruby_api_pack_active_campaign.gemspec` when
   preparing a release or changing packaging metadata.

## Project Structure

- `lib/ruby_api_pack_active_campaign.rb`: public gem entry point
- `lib/ruby_api_pack_active_campaign/configuration.rb`: API URL and token
  configuration
- `lib/ruby_api_pack_active_campaign/connection/`: HTTParty connection wrapper
- `lib/ruby_api_pack_active_campaign/api/`: ActiveCampaign API helper methods
- `lib/ruby_api_pack_active_campaign/version.rb`: gem version
- `spec/`: RSpec coverage for configuration, connection, and API helpers

## Contribution Guidelines

### API helper changes

1. Keep public helper names stable unless the change is intentionally breaking.
2. Add or update focused specs for any endpoint path, HTTP verb, request body,
   or response behavior change.
3. Keep ActiveCampaign SDK or HTTP access centralized in the connection layer.
4. Pass payloads through in shapes that match ActiveCampaign's documented API.
5. Update `README.md` when public usage changes.

### Connection and configuration changes

1. Keep token and base URL handling behind
   `RubyApiPackActiveCampaign.configure`.
2. Do not log API tokens, request payloads with sensitive contact data, or full
   ActiveCampaign responses by default.
3. Keep response parsing and error behavior covered by specs.
4. Preserve backward compatibility unless the changelog and PR clearly classify
   a breaking change.

### Code and tooling

- Follow the repo's RuboCop configuration.
- Prefer small, pattern-aligned changes.
- Keep comments brief and only add them when they explain a non-obvious reason.
- Preserve unrelated local changes.
- Do not create commits, tags, releases, or publish gems unless explicitly
  asked by a maintainer.

## Behavior-Impacting Change Checklist

Use this checklist when touching any public behavior surface:

- `lib/ruby_api_pack_active_campaign.rb`
- `lib/ruby_api_pack_active_campaign/configuration.rb`
- `lib/ruby_api_pack_active_campaign/connection/`
- `lib/ruby_api_pack_active_campaign/api/`
- `README.md`

Before merge:

1. Update or add focused specs.
2. Run `bundle exec rspec`.
3. Run `bundle exec rubocop`.
4. Build with `gem build ruby_api_pack_active_campaign.gemspec` when packaging
   metadata changed.
5. Update `README.md` if installation, configuration, endpoint, or usage
   guidance changed.
6. Update `CHANGELOG.md` under `[Unreleased]`.
7. Classify the change as additive, behavior change, breaking, or docs/config
   only in the pull request.
8. Confirm no ActiveCampaign API tokens, production account URLs, contact data,
   or other sensitive identifiers appear in logs, fixtures, docs, or examples.

## Pull Request Checklist

1. Keep the change focused.
2. Fill out every section of `.github/pull_request_template.md`.
3. Link an issue or write `N/A`.
4. Include a concise summary and reviewer notes.
5. Leave blocked checklist items unchecked with a short note.

## Release Hygiene

For maintainers, a release should keep these records aligned:

1. Update `lib/ruby_api_pack_active_campaign/version.rb`.
2. Move relevant `CHANGELOG.md` `[Unreleased]` notes into a dated version entry.
3. Run `bundle exec rspec`.
4. Run `bundle exec rubocop`.
5. Build the gem from the matching source state.
6. Publish release notes from the matching changelog entry.

## Questions

Open an issue if you need direction before making a larger change.

## Code of Conduct

By participating in this project, you agree to follow the
[Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contributions will be licensed under the
MIT License.
