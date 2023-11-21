class Users::PageInfo::DestroyOperation < ApplicationOperation
  attr_reader :page_info

  def call
    load_page_info
    delete_page_info
  end

  private

  def load_page_info
    @page_info = PageInfo.find(params[:id])
  end

  def delete_page_info
    @page_info.destroy
  end
end
