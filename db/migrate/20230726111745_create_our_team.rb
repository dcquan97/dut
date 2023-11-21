class CreateOurTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :our_teams do |t|
      t.string :name
      t.text :title
      t.string :team_image
      t.integer :status , default: '0', null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
