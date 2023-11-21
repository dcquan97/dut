# frozen_string_literal: true
class TourNuocNgoaiController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = Tour.where( status: 1 ).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = tour_nuoc_ngoai_index_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = Tour.where( status: 2, category: ['indo', 'cam', 'sing', 'malai', 'thailan', 'lao'] ).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = tour_nuoc_ngoai_index_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @tour = Tour.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 1).first
    else
      @tour = Tour.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 0).first
    end
  end
end