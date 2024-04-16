class Users::Banners::DestroyOperation < ApplicationOperation
  attr_reader :banner

  def call
    load_banner
    delete_banner
  end

  private

  def load_banner
    @banner = Banner.find(params[:id])
  end

  def delete_banner
    @banner.destroy
  end
end
