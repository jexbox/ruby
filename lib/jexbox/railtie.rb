require 'jexbox'
require 'jexbox/middleware/notifier'
require 'rails'

module Jexbox
  class Railtie < ::Rails::Railtie
    initializer "jexbox.configure_notifier_middleware" do |app|
      middleware = if defined?(ActionDispatch::DebugExceptions)
                     "ActionDispatch::DebugExceptions" # Rails >= 3.2.0
                   else
                     "ActionDispatch::ShowExceptions" # Rails < 3.2.0
                   end

      app.config.middleware.insert_after middleware, "Jexbox::Middleware::Notifier"
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
