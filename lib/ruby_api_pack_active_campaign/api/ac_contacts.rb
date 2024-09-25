# frozen_string_literal: true

module RubyApiPackActiveCampaign
  module Api
    class AcContacts
      # Fetch a specific contact by ID
      def self.ac_contact_by_id(contact_id)
        fetch_contact("/contacts/#{contact_id}")
      end

      # Create a new contact
      def self.ac_create_contact(contact_params)
        post_contact('/contacts', contact_params)
      end

      private

      def self.fetch_contact(endpoint)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).activecampaign_api_connection
      end

      def self.post_contact(endpoint, contact_params)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_post_api_connection(contact_params)
      end
    end
  end
end
