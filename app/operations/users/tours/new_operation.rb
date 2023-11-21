class Users::Tours::NewOperation < Users::Tours::BaseOperation
  private

  def build_form
    @form = Users::Tours::CreateForm.new(permit_params)
  end
end
