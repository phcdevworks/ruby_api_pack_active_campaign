# frozen_string_literal: true

module RubyApiPackActiveCampaign
  module Connection
    class AcConnect
      attr_reader :ac_api_url_base, :ac_api_path

      def initialize(ac_api_url_base, ac_api_path)
        @ac_api_url_base = ac_api_url_base
        @ac_api_path = ac_api_path
      end

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

      private

      # General response handler
      def handle_response(response)
        case response.code
        when 200..299
          parse_response(response)
        else
          raise "API Request failed with status #{response.code}: #{response.body}"
        end
      end

      # Parsing response to JSON format
      def parse_response(response)
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
