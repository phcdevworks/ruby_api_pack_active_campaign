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
- [ ] Review whether `Oj` should be used directly or removed if unused.

## Release

- [ ] Confirm gemspec metadata links point to the repository and changelog.
- [ ] Document RubyGems release steps.
- [ ] Keep CI, Codecov, and publish workflows aligned with release docs.
- [ ] Confirm supported Ruby versions in CI match the gemspec.
