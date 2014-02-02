module Jexbox
  module Middleware
    class Notifier
      def initialize(app)
        @app = app
      end

      def call(env)
        response = @app.call(env)
      rescue Exception => e
        Jexbox.notify(e)
        raise e
      end
    end
  end
end
