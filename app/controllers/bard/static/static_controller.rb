module Bard
  module Static
    class StaticController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_filter :before_bard_static,
        :if => proc { respond_to?(:before_bard_static, true) }

      def mockups
        env["bard_static.prototype"] = true
        with_404_handler { render_with_index "mockups/#{params[:file_path]}", :layout => false }
      end

      def static
        layout = !request.xhr? # render ajax responses with no layout
        with_404_handler { render_with_index "static/#{params[:file_path]}", :layout => layout }
      end

      private

      def with_404_handler
        begin
          yield
        rescue ActionView::MissingTemplate
          render :text => "Not Found", :status => 404
        end
      end

      def render_with_index path, options = {}
        begin
          options = options.dup # render is destructive to the options hash!
          options = options.merge(:template => path)
          render options
        rescue ActionView::MissingTemplate
          options[:template] = "#{path}/index"
          render options
        end
      end
    end
  end
end

