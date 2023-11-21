# frozen_string_literal: true
class VietnamCentralController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = Tour.where(category: 'vietnam central', status: 1 ).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = package_tours_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = Tour.where(category: 'vietnam central', status: 2 ).common_order.ransack(params[:query])
      @paginate, @tour = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = package_tours_path
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