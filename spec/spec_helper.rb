# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter 'lib/ruby_api_pack_active_campaign/version'
  track_files 'lib/ruby_api_pack_active_campaign/**/*.rb'
  enable_coverage :branch
end

require 'ruby_api_pack_active_campaign'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.before(:suite) do
    RubyApiPackActiveCampaign::Configuration.new.tap do |c|
      c.ac_api_url = ENV['AC_API_URL'] || 'https://youraccountname.api-us1.com/api/3'
      c.ac_api_token = ENV['AC_API_TOKEN']
    end
  end
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.before do
    puts "AC_API_URL: #{ENV['AC_API_URL']}"
    puts "AC_API_TOKEN: #{ENV['AC_API_TOKEN']}"

    stub_request(:any, /#{Regexp.quote(ENV['AC_API_URL'] || 'https://youraccountname.api-us1.com/api/3')}.*/)
      .with(
        headers: { 'Api-Token' => ENV['AC_API_TOKEN'] }
      ).to_return(status: 200, body: '{"message": "Success"}', headers: {})
  end
end
