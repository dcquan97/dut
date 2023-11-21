class Users::OurPartner::NewOperation < Users::OurPartner::BaseOperation
  private

  def build_form
    @form = Users::OurPartner::CreateForm.new(permit_params)
  end
end
