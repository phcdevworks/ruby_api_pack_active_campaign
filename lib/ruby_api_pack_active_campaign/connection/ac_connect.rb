# frozen_string_literal: true

require 'ruby_api_pack_core'

module RubyApiPackActiveCampaign
  module Connection
    class AcConnect < RubyApiPackCore::Connection::Base
      private

      def auth_headers
        { 'Api-Token' => RubyApiPackActiveCampaign.configuration.ac_api_token }
      end
    end
  end
end
