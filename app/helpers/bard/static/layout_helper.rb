module Bard
  module Static
    module LayoutHelper
      def layout layout, &block
        render :text => capture(&block), :layout => "layouts/#{layout}"
      end
    end
  end
end
