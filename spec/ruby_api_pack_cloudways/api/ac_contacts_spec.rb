# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_active_campaign/api/ac_contacts'

RSpec.describe RubyApiPackActiveCampaign::Api::AcContacts do
  let(:ac_connect_instance) { instance_double(RubyApiPackActiveCampaign::Connection::AcConnect) }

  before do
    # Mock the configuration for RubyApiPackActiveCampaign
    allow(RubyApiPackActiveCampaign).to receive(:configuration).and_return(
      double(ac_api_url: 'https://api.example.com', ac_api_token: 'fake_token')
    )

    # Mock the Connection::AcConnect instance and its methods
    allow(RubyApiPackActiveCampaign::Connection::AcConnect).to receive(:new).and_return(ac_connect_instance)

    # Mock the GET request method, which fetches contact details
    allow(ac_connect_instance).to receive(:ac_post_api_connection).and_return(
      'contacts' => ['contact1'],
      'message' => 'Contact created successfully'
    )
  end

  describe '.contact_by_id' do
    it 'returns a contact by ID' do
      contact = described_class.contact_by_id(123)
      expect(contact).to eq('contacts' => ['contact1'])
    end
  end

  describe '.contact_list' do
    it 'returns a list of contacts' do
      contacts = described_class.contact_list
      expect(contacts).to eq(['contact1'])
    end
  end

  describe '.create_contact' do
    let(:contact_params) { { email: 'john@example.com', first_name: 'John', last_name: 'Doe' } }

    it 'creates a new contact' do
      response = described_class.create_contact(contact_params)
      expect(response).to eq('message' => 'Contact created successfully')
    end
  end
end
