class Users::Banners::UpdateOperation < Users::Banners::BaseOperation
  attr_reader :banner

  def call
    load_banner
    build_form
    validate { return true }
    update_banner
  end

  private

  def load_banner
    @banner = New.find(params[:id])
  end

  def build_form
    @form = Users::Banners::UpdateForm.banner(permit_params)
  end

  def update_banner
    banner.update! form.attributes.reject { |_, v| v.blank?}
  end

end
