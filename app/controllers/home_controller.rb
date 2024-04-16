class HomeController < ApplicationController
  def index
    if I18n.locale != :vi
      @package_post = Post.where( status: 1 ).common_order.first(10)
      @highlight_post = Post.where(highlight: 1, status: 1 ).common_order.first(10)
      @new = New.where(status: 1 ).common_order.first(10)
      @banner = Banner.where(status: 1 ).common_order.first(10)
      @partner = OurPartner.common_order.first(10)
      @team = OurTeam.where(status: 1).common_order.first(10)
      @page_info = PageInfo.where( status: 1).first
    else
      @package_post = Post.where( status: 2 ).common_order.first(10) || Post.where( status: 1 ).common_order.first(10)
      @highlight_post = Post.where(highlight: 1, status: 2 ).common_order.first(10) || Post.where(highlight: 1, status: 1 ).common_order.first(10)
      @new = New.where(status: 2 ).common_order.first(10) || New.where(status: 1 ).common_order.first(10)
      @banner = Banner.where(status: 2 ).common_order.first(10)
      @partner = OurPartner.common_order.first(10)
      @team = OurTeam.where(status: 2).common_order.first(10) || OurTeam.where(status: 1).common_order.first(10)
      @page_info = PageInfo.where( status: 0).first || PageInfo.where( status: 1).first
    end
  end
end