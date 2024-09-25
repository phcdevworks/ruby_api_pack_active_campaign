# frozen_string_literal: true

require 'httparty'
require 'oj'

require_relative 'ruby_api_pack_active_campaign/version'

module RubyApiPackActiveCampaign
  class Error < StandardError; end
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
