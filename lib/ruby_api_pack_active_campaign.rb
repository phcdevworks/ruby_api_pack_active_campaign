# frozen_string_literal: true

require 'ruby_api_pack_core'

require_relative 'ruby_api_pack_active_campaign/configuration'
require_relative 'ruby_api_pack_active_campaign/connection/ac_connect'
require_relative 'ruby_api_pack_active_campaign/api/ac_contacts'

module RubyApiPackActiveCampaign
  extend RubyApiPackCore::Configurable

  def self.configuration_class
    Configuration
  end
end
