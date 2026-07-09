# Security Policy

## Supported Versions

PHCDevworks applies security fixes to the current release line of this gem.
Please use the latest published version of `ruby_api_pack_active_campaign`
whenever possible.

## Reporting a Vulnerability

Do not open a public issue for security problems.

Use GitHub Security Advisories for this repository whenever possible. If that
is not available, contact the maintainers through GitHub.

Include:

1. A clear description of the issue and its impact
2. Steps to reproduce or a proof of concept
3. Affected versions, if known
4. Any suggested mitigation

## Response Expectations

1. We aim to acknowledge reports within 48 hours.
2. We aim to provide an initial assessment within 5 business days.
3. We will coordinate disclosure timing with the reporter when possible.

## Security Guidance

- Keep Ruby, Bundler, HTTParty, and development dependencies up to date.
- Do not expose ActiveCampaign API tokens, production account URLs, contact
  data, request payloads, or full response bodies in logs or examples.
- Store API credentials through Rails encrypted credentials, environment
  variables, or a secure deployment secret manager.
- Review automated dependency updates and advisories before release.
- Mock external ActiveCampaign requests in specs instead of recording sensitive
  production traffic.

## Contact

For non-sensitive security questions, open an issue or discussion in this
repository.
