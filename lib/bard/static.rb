require "bard/static/no_robots_middleware"
require_relative "../../app/helpers/bard/static/mockup_helper"

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
