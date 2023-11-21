class Users::CarRental::UpdateOperation < Users::CarRental::BaseOperation
  attr_reader :car_rental

  def call
    load_car_rental
    build_form
    validate { return true }
    update_car_rental
  end

  private

  def load_car_rental
    @car_rental = CarRental.find(params[:id])
  end

  def build_form
    @form = Users::CarRental::UpdateForm.new(permit_params)
  end

  def update_car_rental
    car_rental.update! form.attributes.reject { |_, v| v.blank?}
  end

end
