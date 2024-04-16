class CreateBanner < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :title
      t.string :thumbnail
      t.integer :status, default: '0', null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
