# Change Watch

Watch these areas closely during reviews:

- `lib/ruby_api_pack_active_campaign/configuration.rb`: credential and base URL
  handling
- `lib/ruby_api_pack_active_campaign/connection/ac_connect.rb`: HTTP verbs,
  headers, JSON parsing, and API error behavior
- `lib/ruby_api_pack_active_campaign/api/ac_contacts.rb`: endpoint paths,
  payload forwarding, and helper names
- `spec/`: contract coverage for public helper behavior
- `.github/workflows/`: CI and publish behavior

Any change to configuration, connection, or API helper behavior should include
RSpec coverage and a changelog entry.
