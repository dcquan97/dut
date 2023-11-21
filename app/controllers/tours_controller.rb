# frozen_string_literal: true
class ToursController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = Tour.where(status: 1).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = tours_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = Tour.where(status: 2).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = tours_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @tour = Tour.find_by(id: params[:id])
      @highlight_tour = Tour.where(highlight: 1, status: 1).common_order.first(10)
      @page_info = PageInfo.where(status: 1).first
    else
      @tour = Tour.find_by(id: params[:id])
      @highlight_tour = Tour.where(highlight: 1, status: 2).common_order.first(10)
      @page_info = PageInfo.where(status: 0).first
    end
  end
end