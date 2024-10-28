# frozen_string_literal: true

require_relative 'lib/ruby_api_pack_active_campaign/version'

Gem::Specification.new do |spec|
  spec.name = 'ruby_api_pack_active_campaign'
  spec.version = RubyApiPackActiveCampaign::VERSION
  spec.authors     = ['PHCDevworks', 'Brad Potts']
  spec.email       = ['info@phcdevworks.com', 'brad.potts@phcdevworks.com']
  spec.homepage    = 'https://phcdevworks.com/'

  spec.summary     = 'API Pack for Active Campaign API.'
  spec.description = 'RubyApiPackActiveCampaign is a Ruby gem designed to simplify interaction with the ActiveCampaign API.
  This gem offers an easy-to-use interface for managing contacts, lists, and automations within ActiveCampaign.'
  spec.license = 'MIT'

  # Specify the required Ruby version
  spec.required_ruby_version = '>= 3.0.0'

  # Gem Meta Data
  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/phcdevworks/ruby_api_pack_active_campaign/'
  spec.metadata['changelog_uri'] = 'https://github.com/phcdevworks/ruby_api_pack_active_campaign/releases'

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Main Dependencies
  spec.add_dependency 'httparty', '~> 0.22.0'
  spec.add_dependency 'oj', '~> 3.16'
end
