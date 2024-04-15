class CreatePageInfo < ActiveRecord::Migration[7.0]
  def change
    create_table :page_infos do |t|
      t.string :about_home
      t.text :about_us
      t.string :image_about
      t.string :link_fb
      t.string :link_youtube
      t.string :link_twitter
      t.string :contact_us
      t.string :sdt
      t.string :email
      t.string :address
      t.string :image_contact
      t.integer :status, default: '0', null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
