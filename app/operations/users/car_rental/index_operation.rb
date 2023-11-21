class Users::CarRental::IndexOperation < Users::CarRental::BaseOperation
  attr_reader :car_rental, :query, :paginate

  def call
    load_car_rental
  end

  private

  def load_car_rental
    @query = CarRental.ransack(params[:query])
    @paginate, @car_rental = pagy(query.result, items: per_page)
  end
end
