class Users::CarRental::NewOperation < Users::CarRental::BaseOperation
  private

  def build_form
    @form = Users::CarRental::CreateForm.new(permit_params)
  end
end
