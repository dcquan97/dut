class AddHighlightToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :highlight, :integer
  end
end
