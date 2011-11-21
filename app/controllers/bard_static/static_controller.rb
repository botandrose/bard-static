module BardStatic
  class StaticController < ApplicationController
    before_filter :before_bard_static,
      :if => proc { respond_to?(:before_bard_static, true) }

    def serve
      env["bard_static.prototype"] = true
      render "mockups/#{params[:file_path]}", :layout => false
    end

    def static
      render "static/#{params[:file_path]}"
    end
  end
end
