class CreateCarRental < ActiveRecord::Migration[7.0]
  def change
    create_table :car_rentals do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :status , default: '0', null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
