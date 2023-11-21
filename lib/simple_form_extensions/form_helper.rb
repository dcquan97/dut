# vendor/bundle/ruby/2.7.0/gems/simple_form-5.0.3/lib/simple_form/action_view_extensions/form_helper.rb
# frozen_string_literal: true
module SimpleForm
  module ActionViewExtensions
    module FormHelper

      def simple_form_for(record = nil, options = {}, &block)
        options[:builder] ||= SimpleForm::FormBuilder
        options[:html] ||= {}
        unless options[:html].key?(:novalidate)
          options[:html][:novalidate] = !SimpleForm.browser_validations
        end
        if options[:html].key?(:class)
          options[:html][:class] = [SimpleForm.form_class, options[:html][:class]].compact
        else
          options[:html][:class] = [SimpleForm.form_class, SimpleForm.default_form_class].compact
        end

        with_simple_form_field_error_proc do
          options[:scope] ||= ''
          method            = options[:method].presence || determine_method(record)
          options[:local]   = options[:local] == false ? false : true
          args              = options.except(:model, :scope, :url, :format, :method)

          form_with(model: record, scope: options[:scope], url: options[:url], format: options[:format], method: method, **args) do |f|
            yield(f)
          end
        end
      end

      private

      def determine_method(record)
        return :put if record.id.present?
        :post
      rescue
        :post
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include SimpleForm::ActionViewExtensions::FormHelper
end
