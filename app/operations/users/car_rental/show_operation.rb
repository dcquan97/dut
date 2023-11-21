class Users::CarRental::ShowOperation < Users::CarRental::BaseOperation
  attr_reader :car_rental

  private

  def build_form
    @car_rental = CarRental.find(params[:id])
  end
end
