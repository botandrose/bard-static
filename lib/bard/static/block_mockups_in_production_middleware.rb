module Bard
  module Static
    class MockupInProductionError < StandardError
      def initialize(path)
        super("Mockup pages are not available in production: #{path}")
      end
    end

    class BlockMockupsInProductionMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        request = Rack::Request.new(env)

        if Rails.env.production? && request.path.start_with?("/mockups")
          raise MockupInProductionError.new(request.path)
        end

        @app.call(env)
      end
    end
  end
end
