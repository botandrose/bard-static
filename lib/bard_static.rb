require "bard_static/no_robots_middleware"

module BardStatic
  class Engine < ::Rails::Engine
    config.app_middleware.use NoRobotsMiddleware
  end
end
