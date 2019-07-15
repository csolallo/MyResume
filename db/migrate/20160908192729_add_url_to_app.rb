class AddUrlToApp < ActiveRecord::Migration[5.0]
  def change
    add_column :apps, :image_url, :string
  end
end
