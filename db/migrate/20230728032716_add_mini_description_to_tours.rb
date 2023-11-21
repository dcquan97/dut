class AddMiniDescriptionToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :mini_description, :string
  end
end
