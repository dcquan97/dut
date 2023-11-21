class AddRatingToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :rating, :integer
  end
end
