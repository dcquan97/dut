module Layout::SidebarHelper
  def item_nav_link(options = {})
    active  = active_item_nav_link(options[:ctrl], options[:act])
    ico     = content_tag :i, '', class: options[:icon]
    text    = content_tag :span, options[:text]
    method  = options[:method] || 'get'
    link    = link_to "#{ico} #{text}".html_safe, options[:link], class: "nav-link", method: "#{method}"
    content_tag :li, link, class: "nav-item #{active}"
  end

  def heading_sidebar(text)
    content_tag :hr, class: 'sidebar-divider' do
      content_tag :div, text, class: 'sidebar-heading'
    end
  end

  private

  def active_item_nav_link(ctrl, act)
    ctrl&.downcase!
    act&.downcase!

    return 'active' if ctrl == controller_name && act == action_name
    'active' if ctrl == controller_name
  end
end
