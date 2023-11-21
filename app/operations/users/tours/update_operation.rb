class Users::Tours::UpdateOperation < Users::Tours::BaseOperation
  attr_reader :tour

  def call
    load_tour
    build_form
    validate { return true }
    update_tour
  end

  private

  def load_tour
    @tour = Tour.find(params[:id])
  end

  def build_form
    @form = Users::Tours::UpdateForm.new(permit_params)
  end

  def update_tour
    tour.update! form.attributes.reject { |_, v| v.blank?}
  end

end
