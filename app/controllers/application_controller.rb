class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def extract_locale_from_accept_language_header
    request.location.country
    # request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first # lọc lấy mã ngôn ngữ đc ghi trong header
  end

  def set_locale
    if extract_locale_from_accept_language_header == "VN"
      I18n.locale = "vi" || I18n.default_locale # gán ngỗn ngữ đó là mặc đinh, nếu trong header ko có thì ta sẽ sử dụng ngôn ngữ mặc định trong con
    else
      I18n.locale = "vi"
    end
  end
end
