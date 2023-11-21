class Users::News::NewOperation < Users::News::BaseOperation
  private

  def build_form
    @form = Users::News::CreateForm.new(permit_params)
  end
end
