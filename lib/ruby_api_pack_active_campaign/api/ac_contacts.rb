# frozen_string_literal: true

module RubyApiPackActiveCampaign
  module Api
    class AcContacts
      def self.contact_by_id(contact_id)
        fetch_resource("/contacts/#{contact_id}")
      end

      def self.contact_list
        fetch_resource('/contacts')['contacts']
      end

      def self.create_contact(contact_params)
        post_resource('/contacts', contact_params)
      end

      private

      def self.fetch_resource(endpoint)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_post_api_connection({})
      end

      def self.post_resource(endpoint, params)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_post_api_connection(params)
      end

      private_class_method :fetch_resource, :post_resource
    end
  end
end
