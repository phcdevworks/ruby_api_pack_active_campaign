# frozen_string_literal: true

require 'httparty'
require 'oj'

require_relative 'ruby_api_pack_active_campaign/ac_configuration'
require_relative 'ruby_api_pack_active_campaign/connection/ac_connect'
require_relative 'ruby_api_pack_active_campaign/api/ac_contacts'

module RubyApiPackActiveCampaign
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= AcConfiguration.new
      yield(configuration)
    end
  end
end
