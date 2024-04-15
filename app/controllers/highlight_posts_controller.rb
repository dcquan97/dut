# frozen_string_literal: true
class HighlightToursController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = Tour.where(highlight: 1, status: 1).common_order.ransack(params[:query])
      @paginate, @post = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = highlight_posts_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = Tour.where(highlight: 1, status: 2).common_order.ransack(params[:query])
      @paginate, @post = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = highlight_posts_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @post = Tour.find_by(id: params[:id], category: 'highlight post')
      @page_info = PageInfo.where(status: 1).first
    else
      @post = Tour.find_by(id: params[:id], category: 'highlight post')
      @page_info = PageInfo.where(status: 0).first
    end
  end
end