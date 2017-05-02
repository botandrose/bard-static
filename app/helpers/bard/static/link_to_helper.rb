module Bard
  module Static
    module LinkToHelper
      # Don't enable by default, because its a performance regression. :(
      # def link_to(*args, &block)
      #   args.unshift capture(&block) if block_given?
      #   LinkTo.render(self, *args)
      # end

      def link_to_current(*args, &block)
        args.unshift capture(&block) if block_given?
        LinkToCurrent.render(self, *args) do |link|
          link.current_path = request.fullpath
        end
      end

      def link_to_nav(*args, &block)
        args.unshift capture(&block) if block_given?
        LinkToNav.render(self, *args) do |link|
          link.current_path = request.fullpath
        end
      end

      class LinkTo
        def self.render *args, &block
          if block_given?
            new(*args, &block).render
          else
            new(*args).render
          end
        end

        def initialize context, name, options = {}, html_options = {}, &block
          @context = context
          @name         = name
          @options      = options || {}
          @html_options = HashWithIndifferentAccess.new(html_options)
          @html_options = @context.send(:convert_options_to_data_attributes, @options, @html_options)
          yield self if block_given?
        end
        
        def render
          "<a #{href_attr}#{tag_options}>#{body}</a>".html_safe
        end

        attr_reader :context, :name, :options, :html_options

        def url
          context.url_for(options)
        end

        private

        def href_attr
          "href=\"#{ERB::Util.html_escape(url)}\"" unless html_options["href"]
        end

        def tag_options 
          if context.respond_to?(:tag_builder, true) # Rails 5.1+
            context.send(:tag_builder).tag_options(html_options)
          else
            context.send(:tag_options, html_options)
          end
        end

        def body
          ERB::Util.html_escape(name || url)
        end
      end

      class LinkToCurrent < LinkTo
        attr_accessor :current_path

        def add_class class_name
          html_options[:class] ||= ""
          html_options[:class] << " #{class_name}"
          html_options[:class].strip!
        end

        def render
          add_class("current") if current_condition
          super
        end

        def current_condition
          html_options.delete(:if) || current_path == url
        end
      end

      class LinkToNav < LinkToCurrent
        def current_condition
          super || current_path.starts_with?(url)
        end
      end
    end
  end
end

