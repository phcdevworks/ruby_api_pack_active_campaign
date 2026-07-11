# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_active_campaign'

RSpec.describe RubyApiPackActiveCampaign::Connection::AcConnect do
  subject(:connection) { described_class.new('https://youraccountname.api-us1.com/api/3', '/contacts') }

  before do
    RubyApiPackActiveCampaign.configure do |config|
      config.ac_api_token = 'your_fake_api_token'
    end
  end

  it 'is a RubyApiPackCore::Connection::Base subclass' do
    expect(described_class).to be < RubyApiPackCore::Connection::Base
  end

  describe '#api_get' do
    let(:success_response) do
      instance_double(
        HTTParty::Response,
        code: 200,
        body: '{"contacts":[{"id":1}]}',
        headers: { 'content-type' => 'application/json' }
      )
    end

    it 'sends the configured API token as the Api-Token header' do
      allow(HTTParty).to receive(:get).and_return(success_response)

      connection.api_get

      expect(HTTParty).to have_received(:get).with(
        'https://youraccountname.api-us1.com/api/3/contacts',
        hash_including(headers: { 'Api-Token' => 'your_fake_api_token' }, query: {})
      )
    end

    it 'returns the parsed JSON body, inherited from RubyApiPackCore::Connection::Base' do
      allow(HTTParty).to receive(:get).and_return(success_response)

      expect(connection.api_get).to eq({ 'contacts' => [{ 'id' => 1 }] })
    end
  end
end
