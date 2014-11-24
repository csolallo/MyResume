class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, :limit => 30, null: false
    end

    create_table :projects_tags, :id => false do |t|
      t.integer :project_id, null: false
      t.integer :tag_id, null: false
    end
    
    add_index :tags, :name, :unique => true
    add_index :projects_tags, [:project_id, :tag_id]
  end
end
