class Users::PageInfo::NewOperation < Users::PageInfo::BaseOperation
  private

  def build_form
    @form = Users::PageInfo::CreateForm.new(permit_params)
  end
end
