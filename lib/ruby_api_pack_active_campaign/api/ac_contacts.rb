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

      def self.sync_contact(contact_params)
        post_resource('/contact/sync', contact_params)
      end

      def self.update_contact(contact_id, contact_params)
        put_resource("/contacts/#{contact_id}", contact_params)
      end

      def self.delete_contact(contact_id)
        delete_resource("/contacts/#{contact_id}")
      end

      def self.update_contact_list_status(contact_list_params)
        post_resource('/contactLists', contact_list_params)
      end

      def self.list_automations(contact_id)
        fetch_resource("/contacts/#{contact_id}/contactAutomations")
      end

      def self.retrieve_contact_score(contact_id)
        fetch_resource("/contacts/#{contact_id}/scoreValues")
      end

      def self.bulk_import_contacts(import_params)
        post_resource('/import/bulk_import', import_params)
      end

      def self.bulk_import_status_list
        fetch_resource('/import/bulk_import')
      end

      def self.bulk_import_status_info
        fetch_resource('/import/info')
      end

      def self.list_contact_activities
        fetch_resource('/activities')
      end

      def self.retrieve_bounce_logs(contact_id)
        fetch_resource("/contacts/#{contact_id}/bounceLogs")
      end

      def self.retrieve_contact_data(contact_id)
        fetch_resource("/contacts/#{contact_id}/contactData")
      end

      def self.retrieve_contact_goals(contact_id)
        fetch_resource("/contacts/#{contact_id}/contactGoals")
      end

      def self.retrieve_contact_list_memberships(contact_id)
        fetch_resource("/contacts/#{contact_id}/contactLists")
      end

      def self.retrieve_contact_logs(contact_id)
        fetch_resource("/contacts/#{contact_id}/contactLogs")
      end

      def self.retrieve_contact_deals(contact_id)
        fetch_resource("/contacts/#{contact_id}/deals")
      end

      def self.retrieve_contact_field_values(contact_id)
        fetch_resource("/contacts/#{contact_id}/fieldValues")
      end

      def self.retrieve_contact_geo_ips(contact_id)
        fetch_resource("/contacts/#{contact_id}/geoIps")
      end

      def self.retrieve_geo_ip_address(geo_address_id)
        fetch_resource("/geoIps/#{geo_address_id}/geoAddress")
      end

      def self.retrieve_contact_notes(contact_id)
        fetch_resource("/contacts/#{contact_id}/notes")
      end

      def self.list_all_notes
        fetch_resource('/notes')
      end

      def self.retrieve_contact_organization(contact_id)
        fetch_resource("/contacts/#{contact_id}/organization")
      end

      def self.retrieve_contact_plus_append(contact_id)
        fetch_resource("/contacts/#{contact_id}/plusAppend")
      end

      def self.retrieve_tracking_logs(contact_id)
        fetch_resource("/contacts/#{contact_id}/trackingLogs")
      end

      def self.retrieve_account_contacts(contact_id)
        fetch_resource("/contacts/#{contact_id}/accountContacts")
      end

      def self.retrieve_automation_entry_counts(contact_id)
        fetch_resource("/contacts/#{contact_id}/automationEntryCounts")
      end

      # Helper methods for different request types
      def self.fetch_resource(endpoint)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_get_api_connection
      end

      def self.post_resource(endpoint, params)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_post_api_connection(params)
      end

      def self.put_resource(endpoint, params)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_put_api_connection(params)
      end

      def self.delete_resource(endpoint)
        Connection::AcConnect.new(
          RubyApiPackActiveCampaign.configuration.ac_api_url,
          endpoint
        ).ac_delete_api_connection
      end
    end
  end
end
