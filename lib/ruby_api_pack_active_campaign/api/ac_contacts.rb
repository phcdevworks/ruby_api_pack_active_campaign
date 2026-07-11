# frozen_string_literal: true

require 'ruby_api_pack_core'

module RubyApiPackActiveCampaign
  module Api
    class AcContacts
      extend RubyApiPackCore::Handlers::ResponseValidator

      ENDPOINT = '/contacts'

      class << self
        def contact_by_id(contact_id)
          validate_response(connection(contact_id).api_get, expected_type: :hash)
        end

        def contact_list
          validate_response(connection.api_get, expected_type: :hash)['contacts']
        end

        def create_contact(contact_params)
          validate_response(connection.api_post(contact_params), expected_type: :hash)
        end

        def sync_contact(contact_params)
          validate_response(connection(nil, '/contact/sync').api_post(contact_params), expected_type: :hash)
        end

        def update_contact(contact_id, contact_params)
          validate_response(connection(contact_id).api_put(contact_params), expected_type: :hash)
        end

        def delete_contact(contact_id)
          validate_response(connection(contact_id).api_delete, expected_type: :hash)
        end

        def update_contact_list_status(contact_list_params)
          validate_response(connection(nil, '/contactLists').api_post(contact_list_params), expected_type: :hash)
        end

        def list_automations(contact_id)
          validate_response(connection(contact_id, '/contactAutomations').api_get, expected_type: :hash)
        end

        def retrieve_contact_score(contact_id)
          validate_response(connection(contact_id, '/scoreValues').api_get, expected_type: :hash)
        end

        def bulk_import_contacts(import_params)
          validate_response(connection(nil, '/import/bulk_import').api_post(import_params), expected_type: :hash)
        end

        def bulk_import_status_list
          validate_response(connection(nil, '/import/bulk_import').api_get, expected_type: :hash)
        end

        def bulk_import_status_info
          validate_response(connection(nil, '/import/info').api_get, expected_type: :hash)
        end

        def list_contact_activities
          validate_response(connection(nil, '/activities').api_get, expected_type: :hash)
        end

        def retrieve_bounce_logs(contact_id)
          validate_response(connection(contact_id, '/bounceLogs').api_get, expected_type: :hash)
        end

        def retrieve_contact_data(contact_id)
          validate_response(connection(contact_id, '/contactData').api_get, expected_type: :hash)
        end

        def retrieve_contact_goals(contact_id)
          validate_response(connection(contact_id, '/contactGoals').api_get, expected_type: :hash)
        end

        def retrieve_contact_list_memberships(contact_id)
          validate_response(connection(contact_id, '/contactLists').api_get, expected_type: :hash)
        end

        def retrieve_contact_logs(contact_id)
          validate_response(connection(contact_id, '/contactLogs').api_get, expected_type: :hash)
        end

        def retrieve_contact_deals(contact_id)
          validate_response(connection(contact_id, '/deals').api_get, expected_type: :hash)
        end

        def retrieve_contact_field_values(contact_id)
          validate_response(connection(contact_id, '/fieldValues').api_get, expected_type: :hash)
        end

        def retrieve_contact_geo_ips(contact_id)
          validate_response(connection(contact_id, '/geoIps').api_get, expected_type: :hash)
        end

        def retrieve_geo_ip_address(geo_address_id)
          validate_response(
            Connection::AcConnect.new(
              RubyApiPackActiveCampaign.configuration.ac_api_url,
              "/geoIps/#{geo_address_id}/geoAddress"
            ).api_get,
            expected_type: :hash
          )
        end

        def retrieve_contact_notes(contact_id)
          validate_response(connection(contact_id, '/notes').api_get, expected_type: :hash)
        end

        def list_all_notes
          validate_response(connection(nil, '/notes').api_get, expected_type: :hash)
        end

        def retrieve_contact_organization(contact_id)
          validate_response(connection(contact_id, '/organization').api_get, expected_type: :hash)
        end

        def retrieve_contact_plus_append(contact_id)
          validate_response(connection(contact_id, '/plusAppend').api_get, expected_type: :hash)
        end

        def retrieve_tracking_logs(contact_id)
          validate_response(connection(contact_id, '/trackingLogs').api_get, expected_type: :hash)
        end

        def retrieve_account_contacts(contact_id)
          validate_response(connection(contact_id, '/accountContacts').api_get, expected_type: :hash)
        end

        def retrieve_automation_entry_counts(contact_id)
          validate_response(connection(contact_id, '/automationEntryCounts').api_get, expected_type: :hash)
        end

        private

        def connection(id = nil, suffix = nil)
          path = id ? "#{ENDPOINT}/#{id}" : ENDPOINT
          path = "#{path}#{suffix}" if suffix
          Connection::AcConnect.new(RubyApiPackActiveCampaign.configuration.ac_api_url, path)
        end
      end
    end
  end
end
