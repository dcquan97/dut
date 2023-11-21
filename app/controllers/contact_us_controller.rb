class ContactUsController < ApplicationController
  def index
    if I18n.locale != :vi
      @page_info = PageInfo.where(status: 1).first
    else
      @page_info = PageInfo.where(status: 0).first
    end
  end
end