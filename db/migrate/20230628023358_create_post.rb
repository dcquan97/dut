class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :mini_description
      t.string :category
      t.string :thumbnail
      t.integer :highlight
      t.integer :status , default: '0', null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
