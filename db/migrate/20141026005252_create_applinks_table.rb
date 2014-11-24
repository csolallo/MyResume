class CreateApplinksTable < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, null: false, :limit => 50
      t.string :platform, null: false, :limit => 50
      t.string :url, null: false, :limit => 100
      t.references :project, null: false
      t.text :comment
    end
    
    add_index :apps, :project_id
  end
end
