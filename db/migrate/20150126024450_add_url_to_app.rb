class AddUrlToApp < ActiveRecord::Migration
  def change
    add_column :apps, :image_url, :string
  end
end
