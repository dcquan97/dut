module Layout::ButtonHelper
  def widget_btn_add(text, path, color: 'primary')
    btn_common(text, path, color, 'fas fa-plus-circle')
  end

  def widget_btn_list(text, path, color: 'info')
    btn_common(text, path, color, 'fas fa-list')
  end

  def widget_btn_custom(text, path, icon:, color: 'info')
    btn_common(text, path, color, icon)
  end

  private

  def btn_common(text, path, color, icon)
    link_to path, class: "d-none d-sm-inline-block btn btn-sm btn-#{color} shadow-sm" do
      content_tag(:i, nil, class: "#{icon} pr-1") + text
    end
  end
end
