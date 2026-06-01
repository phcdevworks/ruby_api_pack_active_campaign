# Release Readiness

Use this checklist before a gem release:

- [ ] `lib/ruby_api_pack_active_campaign/version.rb` reflects the release
      version.
- [ ] `CHANGELOG.md` has a dated entry for the release.
- [ ] `bundle exec rspec` passes.
- [ ] `bundle exec rubocop` passes.
- [ ] `gem build ruby_api_pack_active_campaign.gemspec` succeeds.
- [ ] GitHub Actions are green on the release branch.
- [ ] No ActiveCampaign API tokens, production account URLs, contact data,
      request payloads, or sensitive response bodies are present in source,
      docs, fixtures, or logs.
- [ ] Human maintainer approved publish to RubyGems.
