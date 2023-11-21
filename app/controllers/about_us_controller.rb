class AboutUsController < ApplicationController
  def index
    @team = OurTeam.common_order.first(10)
    if I18n.locale != :vi
      @page_info = PageInfo.where(status: 1).first || PageInfo.where(status: 1).first
    else
      @page_info = PageInfo.where(status: 0).first
    end
  end
end