class HomeController < ApplicationController
  def index
    if I18n.locale != :vi
      @package_post = Tour.where( status: 1 ).common_order.first(10)
      @highlight_post = Tour.where(highlight: 1, status: 1 ).common_order.first(10)
      @car_rental = CarRental.where(status: 1 ).common_order.first(10)
      @new = New.where(status: 1 ).common_order.first(10)
      @our_guest = OurGuest.where(status: 1 ).common_order.first(10)
      @banner = OurGuest.where(status: 1 ).common_order.first(10)
      @partner = OurPartner.common_order.first(10)
      @team = OurTeam.where(status: 1).common_order.first(10)
      @page_info = PageInfo.where( status: 1).first
    else
      @package_post = Tour.where( status: 2 ).common_order.first(10) || Tour.where( status: 1 ).common_order.first(10)
      @highlight_post = Tour.where(highlight: 1, status: 2 ).common_order.first(10) || Tour.where(highlight: 1, status: 1 ).common_order.first(10)
      @car_rental = CarRental.where(status: 2 ).common_order.first(10) || CarRental.where(status: 1 ).common_order.first(10)
      @new = New.where(status: 2 ).common_order.first(10) || New.where(status: 1 ).common_order.first(10)
      @our_guest = OurGuest.where(status: 2 ).common_order.first(10) || OurGuest.where(status: 1 ).common_order.first(10)
      @banner = OurGuest.where(status: 2 ).common_order.first(10) || OurGuest.where(status: 1 ).common_order.first(10)
      @partner = OurPartner.common_order.first(10)
      @team = OurTeam.where(status: 2).common_order.first(10) || OurTeam.where(status: 1).common_order.first(10)
      @page_info = PageInfo.where( status: 0).first || PageInfo.where( status: 1).first
    end
  end
end