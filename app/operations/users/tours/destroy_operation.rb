class Users::Tours::DestroyOperation < ApplicationOperation
  attr_reader :tour

  def call
    load_tour
    delete_tour
  end

  private

  def load_tour
    @tour = Tour.find(params[:id])
  end

  def delete_tour
    @tour.destroy
  end
end
