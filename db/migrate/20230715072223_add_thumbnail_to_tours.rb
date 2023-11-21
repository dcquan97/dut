class AddThumbnailToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :thumbnail, :string
  end
end
