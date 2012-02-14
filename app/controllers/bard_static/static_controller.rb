module BardStatic
  class StaticController < ApplicationController
    before_filter :before_bard_static,
      :if => proc { respond_to?(:before_bard_static, true) }

    def mockups
      env["bard_static.prototype"] = true
      with_404_handler { render "mockups/#{params[:file_path]}", :layout => false }
    end

    def static
      with_404_handler { render "static/#{params[:file_path]}" }
    end

    private

    def with_404_handler
      begin
        yield
      rescue ActionView::MissingTemplate
        head 404
      end
    end
  end
end
