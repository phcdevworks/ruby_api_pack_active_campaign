# Roadmap

This roadmap tracks the direction for `ruby_api_pack_active_campaign` as a Ruby
client gem for ActiveCampaign. It is planning context, not a release promise.

## Current Focus

- Keep the contact helper surface stable and well tested.
- Keep ActiveCampaign API credentials centralized through configuration.
- Keep HTTP request behavior centralized in the connection wrapper.
- Improve release hygiene for RubyGems publishing.

## Near-Term

- Expand README examples for common Rails initializer usage.
- Add clearer guidance for ActiveCampaign request payload shapes.
- Review response and error handling for a typed error class.
- Confirm supported Ruby versions across CI and gem metadata (gemspec allows
  `>= 3.0.0`; CI currently tests only 3.1 and 3.3.x).
- Add specs for any helper methods that are not covered by endpoint-path
  assertions.
- Evaluate additional ActiveCampaign resource groups (lists, tags, deals,
  automations) now that the project is being actively revived — contact
  workflows are the only resource group implemented today.

## Later

- Consider separate modules for automations, lists, accounts, and notes if the
  helper surface grows.
- Add pagination guidance for list endpoints.
- Add retry, timeout, and instrumentation guidance without exposing sensitive
  data.

## Out of Scope

- ActiveCampaign dashboard administration
- Host application data models or persistence
- User-facing Rails controllers or views
- Application-specific marketing automation workflows
- Storage or management of production secrets
