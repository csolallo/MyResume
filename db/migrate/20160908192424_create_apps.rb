class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false, :limit => 50
      t.string :platform, null: false, :limit => 50
      t.string :url, null: false, :limit => 100
      t.references :project, null: false
      t.text :comment
    end
  end
end
