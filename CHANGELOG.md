# Changelog

All notable changes to this project will be documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the versioning
reflects gem releases published to RubyGems.

## [Unreleased]

Change type: dependency/CI cleanup + docs

### Added

- Added standardized PHCDevworks AI operating guides for shared agent behavior,
  Codex, Claude Code, Copilot, and Jules.
- Added roadmap and TODO planning documents for ActiveCampaign gem
  stabilization.
- Added Codex workspace notes and GitHub assistant instructions.
- Added a docs request issue template and standardized pull request template.

### Changed

- Reworked README, contributing, security, and issue guidance around this gem's
  ActiveCampaign client responsibilities.
- Corrected the README project identity from a Cloudways label to
  `ruby_api_pack_active_campaign`.
- Enabled explicit RuboCop new-cop handling and removed duplicate RSpec cop
  configuration.
- Added RubyGems MFA metadata and removed ActiveCampaign environment-variable
  output from the spec helper.
- Added `bundler` and `github-actions` ecosystem entries to
  `.github/dependabot.yml` (daily, 10 open-PR limit) to match the dependency
  hygiene used in `phcdevworks_accounts_stytch` and `spectre-tokens` — only
  `devcontainers` was previously configured, so Ruby gem and Actions
  dependencies never received automated update PRs.
- Added `.coderabbit.yaml` for automated PR review (RuboCop, gitleaks,
  markdownlint, actionlint, semgrep) with path instructions tailored to this
  gem's connection/API helper layers, matching the CodeRabbit setup used in
  `phcdevworks_accounts_stytch` and `spectre-tokens`.
- Added a `deny` block to `.claude/settings.json` blocking destructive
  commands (`rm -rf`, force-push, `git reset --hard`, `git commit`,
  `gem yank`, etc.), matching the guardrail committed in
  `phcdevworks_accounts_stytch` and `spectre-tokens` — this repo previously
  only had an allow list with no deny-list safety net.

### Fixed

- Removed a stale `Oj` mention from `SECURITY.md`'s dependency guidance now
  that the `oj` gem dependency is gone.

### Removed

- Removed the unused `oj` runtime dependency and its `require` from the gem
  entry point; response parsing has always used `JSON.parse` in the
  connection wrapper.
- Removed a stray `.github/workflows/main.yml` CI workflow left over from
  bundler-gem scaffolding — it targeted a nonexistent `master` branch and
  duplicated `test.yml`.

## [0.1.0] - 2024-09-25

### Added

- Initial release.
