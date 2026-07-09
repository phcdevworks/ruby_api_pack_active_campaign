# TODO

## Documentation

- [x] Standardize README structure.
- [x] Add AI operating guides.
- [x] Standardize community health docs.
- [x] Add changelog and roadmap.
- [ ] Add Rails initializer examples for common host app shapes.
- [ ] Add ActiveCampaign payload examples for common contact workflows.
- [ ] Add pagination and rate-limit guidance.

## Ruby Gem

- [ ] Review helper naming for long-term compatibility.
- [ ] Confirm all public helper methods have endpoint-path specs.
- [ ] Consider a custom error class for API failures.
- [ ] Consider timeout configuration for HTTParty requests.
- [x] Review whether `Oj` should be used directly or removed if unused —
      removed; `lib/` only ever used `JSON.parse`.

## Release

- [ ] Confirm gemspec metadata links point to the repository and changelog.
- [ ] Document RubyGems release steps.
- [x] Keep CI, Codecov, and publish workflows aligned with release docs —
      removed stray `.github/workflows/main.yml` (bundler-gem scaffold
      targeting a nonexistent `master` branch, duplicated `test.yml`).
- [ ] Confirm supported Ruby versions in CI match the gemspec — gemspec
      requires `>= 3.0.0`, but CI only tests 3.1 and 3.3.x; either lower the
      matrix to include 3.0 or raise `required_ruby_version` to match CI.
