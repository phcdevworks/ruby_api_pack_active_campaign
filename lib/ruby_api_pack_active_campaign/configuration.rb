# frozen_string_literal: true

module RubyApiPackActiveCampaign
  class AcConfiguration
    attr_accessor :ac_api_url, :ac_api_token, :ac_account_name

    def initialize
      @ac_api_url = 'https://<your-account>.api-us1.com/api/3' # Default base URL
      @ac_api_token = nil
      @ac_account_name = nil
    end
  end
end
