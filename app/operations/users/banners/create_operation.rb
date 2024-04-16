class Users::Banners::CreateOperation < Users::Banners::BaseOperation
  attr_reader :banner

  def call
    build_form
    validate { return true }
    create_banner
  end

  private

  def build_form
    @form = Users::Banners::CreateForm.new(permit_params)
  end

  def create_banner
    @banner = Banner.create!(@form.attributes)
  end
end
