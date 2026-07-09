# Release Readiness

Use this checklist before a maintainer publishes `ruby_api_pack_active_campaign`.

## Validation

- [ ] `bundle exec rspec` passes.
- [ ] `bundle exec rubocop` passes.
- [ ] `gem build ruby_api_pack_active_campaign.gemspec` succeeds.

## Release Records

- [ ] `lib/ruby_api_pack_active_campaign/version.rb` has the intended version.
- [ ] `CHANGELOG.md` has a dated entry for the intended version.
- [ ] README usage reflects the current public API.
- [ ] Security guidance is current.

## Safety

- [ ] No ActiveCampaign API tokens or production account URLs are present in
      source, docs, logs, examples, or fixtures.
- [ ] No contact data, request payloads, or raw live response bodies are
      committed.
- [ ] Any VCR cassettes are sanitized.

## Handoff

- [ ] Summarize change classification.
- [ ] Include validation results.
- [ ] Note any known release risks or skipped checks.
