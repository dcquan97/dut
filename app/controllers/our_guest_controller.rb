# frozen_string_literal: true
class OurGuestController < ApplicationController
  include Pagy::Backend

  def index
    if I18n.locale != :vi
      @query = OurGuest.where(status: 1 ).common_order.ransack(params[:query])
      @paginate, @our_guest = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = our_guest_index_path
      @page_info = PageInfo.where(status: 1).first
    else
      @query = OurGuest.where(status: 2 ).common_order.ransack(params[:query])
      @paginate, @our_guest = pagy(@query.result, items: params[:limit].presence || 20)
      @pagy  = @paginate
      @url   = our_guest_index_path
      @page_info = PageInfo.where(status: 0).first
    end
  end

  def show
    if I18n.locale != :vi
      @our_guest = OurGuest.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 1).first
    else
      @our_guest = OurGuest.find_by(id: params[:id])
      @page_info = PageInfo.where(status: 0).first
    end
  end
end