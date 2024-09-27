# frozen_string_literal: true

module RubyApiPackActiveCampaign
  module Connection
    class AcConnect
      attr_reader :ac_api_url_base, :ac_api_path

      def initialize(ac_api_url_base, ac_api_path)
        @ac_api_url_base = ac_api_url_base
        @ac_api_path = ac_api_path
      end

      # POST request
      def ac_post_api_connection(payload)
        response = HTTParty.post(
          "#{@ac_api_url_base}#{@ac_api_path}",
          headers: {
            'Api-Token' => RubyApiPackActiveCampaign.configuration.ac_api_token,
            'Content-Type' => 'application/json'
          },
          body: payload.to_json
        )
        handle_response(response)
      end

      # GET request
      def ac_get_api_connection
        response = HTTParty.get(
          "#{@ac_api_url_base}#{@ac_api_path}",
          headers: {
            'Api-Token' => RubyApiPackActiveCampaign.configuration.ac_api_token
          }
        )
        handle_response(response)
      end

      # PUT request
      def ac_put_api_connection(payload)
        response = HTTParty.put(
          "#{@ac_api_url_base}#{@ac_api_path}",
          headers: {
            'Api-Token' => RubyApiPackActiveCampaign.configuration.ac_api_token,
            'Content-Type' => 'application/json'
          },
          body: payload.to_json
        )
        handle_response(response)
      end

      # DELETE request
      def ac_delete_api_connection
        response = HTTParty.delete(
          "#{@ac_api_url_base}#{@ac_api_path}",
          headers: {
            'Api-Token' => RubyApiPackActiveCampaign.configuration.ac_api_token
          }
        )
        handle_response(response)
      end

      private

      def handle_response(response)
        case response.code
        when 200..299
          parse_response(response)
        else
          raise "API Request failed with status #{response.code}: #{response.body}"
        end
      end

      def parse_response(response)
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
