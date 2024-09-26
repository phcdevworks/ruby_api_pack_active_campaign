# frozen_string_literal: true

module RubyApiPackActiveCampaign
  class Configuration
    attr_accessor :ac_api_url, :ac_api_token

    def initialize
      @ac_api_url = 'https://youraccountname.api-us1.com/api/3'
      @ac_api_token = nil
    end
  end
end
