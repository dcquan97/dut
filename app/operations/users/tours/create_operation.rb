class Users::Tours::CreateOperation < Users::Tours::BaseOperation
  attr_reader :tour

  def call
    build_form
    validate { return true }
    create_tour
  end

  private

  def build_form
    @form = Users::Tours::CreateForm.new(permit_params)
  end

  def create_tour
    @tour = Tour.create!(@form.attributes)
  end
end
