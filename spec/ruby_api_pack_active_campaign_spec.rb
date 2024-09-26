# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_active_campaign'

RSpec.describe RubyApiPackActiveCampaign do
  describe '.configure' do
    before do
      described_class.configuration = nil
    end

    it 'sets and retrieves the configuration' do
      config_double = instance_double(
        RubyApiPackActiveCampaign::Configuration,
        ac_api_url: 'https://api.example.com',
        ac_api_token: 'fake_token'
      )

      allow(config_double).to receive(:ac_api_url=)
      allow(config_double).to receive(:ac_api_token=)

      allow(described_class).to receive(:configuration).and_return(config_double)

      described_class.configure do |config|
        config.ac_api_url = 'https://api.example.com'
        config.ac_api_token = 'fake_token'
      end

      expect(described_class.configuration.ac_api_url).to eq('https://api.example.com')
      expect(described_class.configuration.ac_api_token).to eq('fake_token')
    end
  end
end
