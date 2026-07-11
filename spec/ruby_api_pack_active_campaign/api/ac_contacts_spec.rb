# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_active_campaign'

RSpec.describe RubyApiPackActiveCampaign::Api::AcContacts do
  let(:connection) { instance_double(RubyApiPackActiveCampaign::Connection::AcConnect) }

  before do
    RubyApiPackActiveCampaign.configure do |config|
      config.ac_api_url = 'https://youraccountname.api-us1.com/api/3'
      config.ac_api_token = 'fake_token'
    end
    allow(RubyApiPackActiveCampaign::Connection::AcConnect).to receive(:new).and_return(connection)
  end

  describe '.contact_by_id' do
    it 'returns a contact by ID' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'id' => 123 })

      expect(described_class.contact_by_id(123)).to eq({ 'id' => 123 })
    end
  end

  describe '.contact_list' do
    it 'returns a list of contacts' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'contacts' => ['contact1'] })

      expect(described_class.contact_list).to eq(['contact1'])
    end
  end

  describe '.create_contact' do
    let(:contact_params) { { email: 'john@example.com', first_name: 'John', last_name: 'Doe' } }

    it 'creates a new contact' do
      allow(connection).to receive(:api_post).with(contact_params).and_return({ 'message' => 'Contact created successfully' })

      expect(described_class.create_contact(contact_params)).to eq({ 'message' => 'Contact created successfully' })
    end
  end

  describe '.sync_contact' do
    let(:contact_params) { { email: 'john@example.com' } }

    it 'syncs a contact data' do
      allow(connection).to receive(:api_post).with(contact_params).and_return({ 'message' => 'Contact synced successfully' })

      expect(described_class.sync_contact(contact_params)).to eq({ 'message' => 'Contact synced successfully' })
    end
  end

  describe '.update_contact' do
    let(:contact_id) { 123 }
    let(:contact_params) { { first_name: 'John' } }

    it 'updates a contact' do
      allow(connection).to receive(:api_put).with(contact_params).and_return({ 'message' => 'Contact updated successfully' })

      expect(described_class.update_contact(contact_id, contact_params)).to eq({ 'message' => 'Contact updated successfully' })
    end
  end

  describe '.delete_contact' do
    let(:contact_id) { 123 }

    it 'deletes a contact' do
      allow(connection).to receive(:api_delete).with(no_args).and_return({ 'message' => 'Contact deleted successfully' })

      expect(described_class.delete_contact(contact_id)).to eq({ 'message' => 'Contact deleted successfully' })
    end
  end

  describe '.update_contact_list_status' do
    let(:contact_list_params) { { contact_id: 123, list_id: 456, status: 1 } }

    it 'updates the list status for a contact' do
      allow(connection).to receive(:api_post)
        .with(contact_list_params).and_return({ 'message' => 'List status updated successfully' })

      expect(described_class.update_contact_list_status(contact_list_params))
        .to eq({ 'message' => 'List status updated successfully' })
    end
  end

  describe '.list_automations' do
    let(:contact_id) { 123 }

    it 'lists automations for a contact' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'automations' => ['automation1'] })

      expect(described_class.list_automations(contact_id)).to eq({ 'automations' => ['automation1'] })
    end
  end

  describe '.retrieve_contact_score' do
    let(:contact_id) { 123 }

    it 'retrieves a contact score' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'score' => 75 })

      expect(described_class.retrieve_contact_score(contact_id)).to eq({ 'score' => 75 })
    end
  end

  describe '.bulk_import_contacts' do
    let(:import_params) { { contacts: [{ email: 'john@example.com' }] } }

    it 'bulk imports contacts' do
      allow(connection).to receive(:api_post).with(import_params).and_return({ 'message' => 'Contacts imported successfully' })

      expect(described_class.bulk_import_contacts(import_params)).to eq({ 'message' => 'Contacts imported successfully' })
    end
  end

  describe '.bulk_import_status_list' do
    it 'retrieves bulk import status list' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'status_list' => ['status1'] })

      expect(described_class.bulk_import_status_list).to eq({ 'status_list' => ['status1'] })
    end
  end

  describe '.bulk_import_status_info' do
    it 'retrieves bulk import status info' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'status_info' => ['info1'] })

      expect(described_class.bulk_import_status_info).to eq({ 'status_info' => ['info1'] })
    end
  end

  describe '.list_contact_activities' do
    it 'retrieves a list of contact activities' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'activities' => ['activity1'] })

      expect(described_class.list_contact_activities).to eq({ 'activities' => ['activity1'] })
    end
  end

  describe '.retrieve_bounce_logs' do
    let(:contact_id) { 123 }

    it "retrieves a contact's bounce logs" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'bounce_logs' => ['log1'] })

      expect(described_class.retrieve_bounce_logs(contact_id)).to eq({ 'bounce_logs' => ['log1'] })
    end
  end

  describe '.retrieve_contact_data' do
    let(:contact_id) { 123 }

    it "retrieves a contact's data" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'data' => ['data1'] })

      expect(described_class.retrieve_contact_data(contact_id)).to eq({ 'data' => ['data1'] })
    end
  end

  describe '.retrieve_contact_goals' do
    let(:contact_id) { 123 }

    it "retrieves a contact's goals" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'goals' => ['goal1'] })

      expect(described_class.retrieve_contact_goals(contact_id)).to eq({ 'goals' => ['goal1'] })
    end
  end

  describe '.retrieve_contact_list_memberships' do
    let(:contact_id) { 123 }

    it "retrieves a contact's list memberships" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'list_memberships' => ['membership1'] })

      expect(described_class.retrieve_contact_list_memberships(contact_id)).to eq({ 'list_memberships' => ['membership1'] })
    end
  end

  describe '.retrieve_contact_logs' do
    let(:contact_id) { 123 }

    it "retrieves a contact's logs" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'logs' => ['log1'] })

      expect(described_class.retrieve_contact_logs(contact_id)).to eq({ 'logs' => ['log1'] })
    end
  end

  describe '.retrieve_contact_deals' do
    let(:contact_id) { 123 }

    it "retrieves a contact's deals" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'deals' => ['deal1'] })

      expect(described_class.retrieve_contact_deals(contact_id)).to eq({ 'deals' => ['deal1'] })
    end
  end

  describe '.retrieve_contact_field_values' do
    let(:contact_id) { 123 }

    it "retrieves a contact's field values" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'field_values' => ['value1'] })

      expect(described_class.retrieve_contact_field_values(contact_id)).to eq({ 'field_values' => ['value1'] })
    end
  end

  describe '.retrieve_contact_geo_ips' do
    let(:contact_id) { 123 }

    it "retrieves a contact's geo IPs" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'geo_ips' => ['geo_ip1'] })

      expect(described_class.retrieve_contact_geo_ips(contact_id)).to eq({ 'geo_ips' => ['geo_ip1'] })
    end
  end

  describe '.retrieve_geo_ip_address' do
    let(:geo_address_id) { 123 }

    it "retrieves a contact's geo IP address" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'geo_address' => '123 Main St' })

      expect(described_class.retrieve_geo_ip_address(geo_address_id)).to eq({ 'geo_address' => '123 Main St' })
    end
  end

  describe '.retrieve_contact_notes' do
    let(:contact_id) { 123 }

    it "retrieves a contact's notes" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'notes' => ['note1'] })

      expect(described_class.retrieve_contact_notes(contact_id)).to eq({ 'notes' => ['note1'] })
    end
  end

  describe '.list_all_notes' do
    it 'retrieves a list of all notes' do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'notes' => ['note1'] })

      expect(described_class.list_all_notes).to eq({ 'notes' => ['note1'] })
    end
  end

  describe '.retrieve_contact_organization' do
    let(:contact_id) { 123 }

    it "retrieves a contact's organization" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'organization' => 'Company XYZ' })

      expect(described_class.retrieve_contact_organization(contact_id)).to eq({ 'organization' => 'Company XYZ' })
    end
  end

  describe '.retrieve_contact_plus_append' do
    let(:contact_id) { 123 }

    it "retrieves a contact's plus append data" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'plus_append' => 'additional data' })

      expect(described_class.retrieve_contact_plus_append(contact_id)).to eq({ 'plus_append' => 'additional data' })
    end
  end

  describe '.retrieve_tracking_logs' do
    let(:contact_id) { 123 }

    it "retrieves a contact's tracking logs" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'tracking_logs' => ['log1'] })

      expect(described_class.retrieve_tracking_logs(contact_id)).to eq({ 'tracking_logs' => ['log1'] })
    end
  end

  describe '.retrieve_account_contacts' do
    let(:contact_id) { 123 }

    it "retrieves a contact's account contacts" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'account_contacts' => ['account_contact1'] })

      expect(described_class.retrieve_account_contacts(contact_id)).to eq({ 'account_contacts' => ['account_contact1'] })
    end
  end

  describe '.retrieve_automation_entry_counts' do
    let(:contact_id) { 123 }

    it "retrieves a contact's automation entry counts" do
      allow(connection).to receive(:api_get).with(no_args).and_return({ 'automation_entry_counts' => 5 })

      expect(described_class.retrieve_automation_entry_counts(contact_id)).to eq({ 'automation_entry_counts' => 5 })
    end
  end
end
