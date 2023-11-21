class CreateOurPartner < ActiveRecord::Migration[7.0]
  def change
    create_table :our_partners do |t|
      t.string :partner_image
      t.integer :status , default: '0', null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
