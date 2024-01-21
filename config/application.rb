require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module HiringElastic
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators.system_tests = nil

    # Generate rspec and factories
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
