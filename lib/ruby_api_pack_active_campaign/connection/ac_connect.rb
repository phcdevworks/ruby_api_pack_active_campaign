# frozen_string_literal: true

module RubyApiPackActiveCampaign
  module Connection
    class AcConnect
      attr_reader :ac_api_url, :ac_api_token

      def initialize(config = RubyApiPackActiveCampaign::AcConfiguration.new)
        @ac_api_url = config.ac_api_url
        @ac_api_token = config.ac_api_token
      end

      def ac_api_connection
        response = HTTParty.get(
          "#{@ac_api_url}/users/me", # Or another endpoint
          headers: { 'Api-Token' => @ac_api_token }
        )
        handle_response(response)
      end

      private

      def handle_response(response)
        case response.code
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.code}"
        end
      end

      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
