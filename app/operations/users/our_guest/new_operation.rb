class Users::OurGuest::NewOperation < Users::OurGuest::BaseOperation
  private

  def build_form
    @form = Users::OurGuest::CreateForm.new(permit_params)
  end
end
