class Users::News::CreateOperation < Users::News::BaseOperation
  attr_reader :new

  def call
    build_form
    validate { return true }
    create_new
  end

  private

  def build_form
    @form = Users::News::CreateForm.new(permit_params)
  end

  def create_new
    @new = New.create!(@form.attributes)
  end
end
