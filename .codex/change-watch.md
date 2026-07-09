# Change Watch

Use this file as a lightweight review log when preparing a documentation,
release, or stabilization handoff.

## Current Watch Points

- Public API helper changes should update specs and README usage.
- Connection and configuration changes should be checked for credential or
  token leakage in logs and fixtures.
- Release changes should keep `VERSION`, `CHANGELOG.md`, gem build output, and
  RubyGems publishing state aligned.

## Validation Notes

Record command results here only when useful for a release or PR handoff. Do
not paste secrets or live ActiveCampaign response payloads.
