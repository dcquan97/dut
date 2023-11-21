class Users::CarRental::CreateOperation < Users::CarRental::BaseOperation
  attr_reader :car_rental

  def call
    build_form
    validate { return true }
    create_car_rental
  end

  private

  def build_form
    @form = Users::CarRental::CreateForm.new(permit_params)
  end

  def create_car_rental
    @car_rental = CarRental.create!(@form.attributes)
  end
end
