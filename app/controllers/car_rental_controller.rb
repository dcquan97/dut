# frozen_string_literal: true
class CarRentalController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = CarRental.where(status: 1).common_order.ransack(params[:query])
      @paginate, @car_rental = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = car_rental_index_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = CarRental.where(status: 2).common_order.ransack(params[:query])
      @paginate, @car_rental = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = car_rental_index_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @car_rental = CarRental.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 1).first
    else
      @car_rental = CarRental.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 0).first
    end
  end
end