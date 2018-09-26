require 'jexbox'
require 'jexbox/middleware/notifier'
require 'rails'

module Jexbox
  class Railtie < ::Rails::Railtie
    initializer "jexbox.configure_notifier_middleware" do |app|
      app.middleware.insert_after ActionDispatch::DebugExceptions, Jexbox::Middleware::Notifier
    end

    config.before_initialize do
      Jexbox.configure do |config|
        config.environment = Rails.env.to_s
        config.app_name = Rails.application.class.to_s
        config.logger = Rails.logger
      end
    end
  end
end
