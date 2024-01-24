require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module HiringElastic
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators.system_tests = nil
    config.active_job.queue_adapter = :sidekiq
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'

    # Generate rspec and factories
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
