# frozen_string_literal: true
class PackagePostsController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = Post.where( status: 1 ).common_order.ransack(params[:query])
      @paginate, @post = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = package_posts_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = Post.where( status: 2 ).common_order.ransack(params[:query])
      @paginate, @post = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = package_posts_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @post = Post.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 1).first
    else
      @post = Post.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 0).first
    end
  end
end