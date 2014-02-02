module Jexbox
  class Payload
    attr_accessor :exception

    def initialize(e)
      raise ArgumentError unless e.kind_of?(Exception)

      self.exception = e
    end

    def server_data
      res = {}
      res['appId'] = Jexbox.configuration.api_key
      res['host'] = Jexbox.configuration.uri
      res['appVersion'] = API_VERSION
      res
    end

    def host_data
      res = {}
      res['name'] = Jexbox.configuration.app_name
      res['version'] = Jexbox.configuration.app_version
      res['url'] = Jexbox.configuration.hostname
      res['env'] = Jexbox.configuration.environment
      res
    end

    def exception_data
      parts = exception.backtrace[0].split(':')
      if parts[2]
        parts[2] = parts[2].gsub(/in `(.*)'/, '\1')
      else
        parts[2] = ''
      end

      res = {}
      res[:exceptionType] = exception.class
      res[:inFile] = parts[0]
      res[:onLine] = parts[1]
      res[:inClass] = ''
      res[:inMethod] = parts[2]
      res
    end

    def exception_details
      res = {}
      res[:class] = ''
      res[:message] = exception.message
      res[:stacktrace] = exception.backtrace
      [res]
    end

    def message_hash
      res = server_data
      res[:notifier] = host_data
      res = res.merge(exception_data)
      res[:exceptions] = exception_details
      res
    end

    def to_json
      message_hash.to_json
    end
  end
end
