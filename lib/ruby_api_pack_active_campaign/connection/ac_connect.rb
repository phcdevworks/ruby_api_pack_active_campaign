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
    end
  end
end
