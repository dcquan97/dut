class Users::CarRental::DestroyOperation < ApplicationOperation
  attr_reader :car_rental

  def call
    load_car_rental
    delete_car_rental
  end

  private

  def load_car_rental
    @car_rental = CarRental.find(params[:id])
  end

  def delete_car_rental
    @car_rental.destroy
  end
end
