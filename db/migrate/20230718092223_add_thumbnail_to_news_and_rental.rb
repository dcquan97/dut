class AddThumbnailToNewsAndRental < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :thumbnail, :string
    add_column :car_rentals, :thumbnail, :string
  end
end
