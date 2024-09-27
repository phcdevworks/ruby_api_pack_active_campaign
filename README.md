# PHCDevworks RubyApiPackCloudways

![Forks](https://img.shields.io/github/forks/phcdevworks/ruby_api_pack_active_campaign.svg?style=social)
![Stars](https://img.shields.io/github/stars/phcdevworks/ruby_api_pack_active_campaign.svg?style=social)
[![Tweet](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2Fphcdevworks%ruby_api_pack_active_campaign)](https://twitter.com/intent/tweet?text=Check%20out%20this%20authentication%20gem%20for%20Rails%20integrating%20with%20Stytch!%20https://github.com/phcdevworks/ruby_api_pack_active_campaign)

## Overview

![Issues](https://img.shields.io/github/issues/phcdevworks/ruby_api_pack_active_campaign.svg)
![Dependabot Status](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg?logo=dependabot)
[![codecov](https://codecov.io/gh/phcdevworks/ruby_api_pack_active_campaign/graph/badge.svg?token=QatALQbsJ5)](https://codecov.io/gh/phcdevworks/ruby_api_pack_active_campaign)
![Build Status](https://github.com/phcdevworks/ruby_api_pack_active_campaign/actions/workflows/test.yml/badge.svg)
[![CodeQL](https://github.com/phcdevworks/ruby_api_pack_active_campaign/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/phcdevworks/ruby_api_pack_active_campaign/actions/workflows/github-code-scanning/codeql)
![Gem Version](https://img.shields.io/gem/v/ruby_api_pack_active_campaign.svg)

RubyApiPackActiveCampaign is a Ruby gem designed to simplify interaction with the ActiveCampaign API. This gem offers an easy-to-use interface for managing contacts, lists, and automations within ActiveCampaign, enabling seamless integration of marketing automation functionality into your Ruby applications. With a modular and extensible design, it allows developers to work with ActiveCampaign resources without handling raw HTTP requests or worrying about low-level API details.

## Key Features:

- **Contact Management**: Easily fetch, create, and update contacts within ActiveCampaign.
- **Contact Lists**: Retrieve lists of contacts or specific contact details using intuitive methods.
- **Resource Fetching**: Use high-level methods to access ActiveCampaign resources with minimal setup.
- **Seamless API Interaction:**: Abstracts complex HTTP requests into simple, reusable Ruby methods.
- **Secure API Configuration**: Manage API tokens and URLs securely through environment variables or configuration blocks.
- **Extensible Design**: Built to support additional ActiveCampaign API resources, making it easy to extend functionality as needed.
- **Error Handling**: Gracefully handle API errors with descriptive messages, ensuring smooth API interactions.
- **RSpec-Ready**: Includes test support and easy-to-mock API responses, facilitating efficient development and testing.

This gem is perfect for Ruby developers looking to integrate ActiveCampaign into their applications, providing essential marketing automation tools with minimal effort.

## Usage

### 1. Set up Active Campaign API credentials

You will need to configure your Active Campaign API credentials in your Ruby environment. Here’s how you can do it:

1. Open your configuration block in the initializer or main application file:

```ruby
RubyApiPackActiveCampaign.configure do |config|
  config.ac_api_url = '<YOUR_ACTIVECAMPAIGN_API_URL>'
  config.ac_api_token = '<YOUR_ACTIVECAMPAIGN_API_KEY>'
end
```

2. Save and restart your application.

## Installation
  
Add this line to your application's Gemfile:

```ruby
gem "ruby_api_pack_active_campaign"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ruby_api_pack_active_campaign
```

## Contributing

[![contributors](https://contributors-img.web.app/image?repo=phcdevworks/ruby_api_pack_active_campaign)](https://github.com/phcdevworks/ruby_api_pack_active_campaign/graphs/contributors)
  
![Last Commit](https://img.shields.io/github/last-commit/phcdevworks/ruby_api_pack_active_campaign.svg)
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
  
![License](https://img.shields.io/github/license/phcdevworks/ruby_api_pack_active_campaign.svg)
