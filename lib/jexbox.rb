require 'jexbox/payload'
require 'jexbox/transport'
require 'jexbox/configuration'
require 'jexbox/railtie' if defined?(Rails::Railtie)

require 'json'

module Jexbox
  API_VERSION = '0.0.1'
  DEFAULT_URL = 'https://jexbox.com/api/notify'

  NOTIFIER_NAME = 'Ruby Jexbox'
  NOTIFIER_VERSION = '0.0.0'

  class << self
    attr_accessor :transport

    def configuration
      @configuration ||= Configuration.new
    end

    def notify(e)
      msg = Payload.new(e)
      begin
        transport.send_message(msg)
      rescue Exception => ex
        if configuration.logger
          configuration.logger.error <<-EOF
Failed to notify Jexbox about #{e.message} due to #{ex.backtrace}.
EOF
        end
      end
    end

    def configure(&block)
      block.call(configuration)
      self.transport = Transport.new(configuration)
    end
  end
end
