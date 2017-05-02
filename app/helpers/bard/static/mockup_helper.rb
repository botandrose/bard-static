require "ostruct"

module Bard
  module Static
    module MockupHelper
      def layout layout, &block
        render html: capture(&block), layout: "layouts/#{layout}"
      end

      def mockup_form_for &block
        form_for MockupModel.new, url: ".", &block
      end

      class MockupModel < OpenStruct
        include ActiveModel::Model
      end
    end
  end
end
