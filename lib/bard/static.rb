require "bard/static/no_robots_middleware"

module Bard
  module Static
    class Engine < ::Rails::Engine
      config.app_middleware.use NoRobotsMiddleware

      initializer "nacelle integration" do
        Cell::Base.class_eval do
          helper Bard::Static::MockupHelper
        end if defined?(Cell::Base)
      end
    end
  end
end
