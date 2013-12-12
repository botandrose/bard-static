require "bard/static/no_robots_middleware"

module Bard
  module Static
    class Engine < ::Rails::Engine
      config.app_middleware.use NoRobotsMiddleware
    end
  end
end
