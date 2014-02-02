require 'net/http'

module Jexbox
  class Transport
    attr_accessor :configuration

    def initialize(conf)
      self.configuration = conf
    end

    def uri
      configuration.uri
    end

    def send_message(payload)
      return unless configuration.enabled

      req = Net::HTTP::Post.new(uri)
      req['Authorization'] = configuration.api_key
      req['Content-Type'] = 'application/json'
      req.body = payload.to_json

      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
    end
  end
end
