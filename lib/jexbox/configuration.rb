module Jexbox
  class Configuration
    EXCLUDED_ENVIRONMENTS = ['test', 'development']

    attr_accessor :api_key
    attr_accessor :logger

    def uri
      @uri || URI(DEFAULT_URL)
    end

    def uri=(url)
      @uri = url.kind_of?(String) ? URI(url) : url
    end

    attr_writer :app_name
    def app_name
      @app_name || NOTIFIER_NAME
    end

    attr_writer :app_version
    def app_version
      @app_version || NOTIFIER_VERSION
    end

    attr_writer :hostname
    def hostname
      @hostname || Socket.gethostname
    end

    attr_writer :environment
    def environment
      @environment || 'development'
    end

    attr_writer :enabled
    def enabled
      if @enabled.nil?
        not EXCLUDED_ENVIRONMENTS.include?(environment)
      else
        @enabled
      end
    end
  end
end
