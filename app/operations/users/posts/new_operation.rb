class Users::Posts::NewOperation < Users::Posts::BaseOperation
  private

  def build_form
    @form = Users::Posts::CreateForm.new(permit_params)
  end
end
