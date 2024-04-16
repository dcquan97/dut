class Users::Banners::NewOperation < Users::Banners::BaseOperation
  private

  def build_form
    @form = Users::Banners::CreateForm.new(permit_params)
  end
end
