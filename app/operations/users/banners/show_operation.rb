class Users::Banners::ShowOperation < Users::Banners::BaseOperation
  attr_reader :banner

  private

  def build_form
    @banner = Banner.find(params[:id])
  end
end
