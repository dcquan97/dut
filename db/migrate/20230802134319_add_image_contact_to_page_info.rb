class AddImageContactToPageInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :page_infos, :image_contact, :string
  end
end
