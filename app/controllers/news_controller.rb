# frozen_string_literal: true
class NewsController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = New.where(status: 1 ).common_order.ransack(params[:query])
      @paginate, @new = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = news_index_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = New.where(status: 2 ).common_order.ransack(params[:query])
      @paginate, @new = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = news_index_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @new = New.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 1).first
    else
      @new = New.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 0).first
    end
  end
end