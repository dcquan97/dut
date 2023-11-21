# Tuts: https://gist.github.com/maxivak/57a2fb71afeb9efcf771
module ButtonComponents
  def submit_with_cancel(*args, &block)
    template.content_tag :div, :class => 'form-group' do
      options         = args.extract_options!
      options[:class] = [options[:class], 'btn-primary'].compact
      args << options

      if !args[0][:value] && self.object.try(:id).present?
        args[0][:value] = I18n.t('helpers.submit.update')
      end

      # with cancel link
      if cancel = options.delete(:cancel)
        btn_cancel = template.link_to I18n.t('helpers.submit.cancel'), cancel, class: 'btn btn-link btn-cancel'
        submit(*args, &block) + btn_cancel
      else
        submit(*args, &block)
      end
    end
  end
end

SimpleForm::FormBuilder.send :include, ButtonComponents
