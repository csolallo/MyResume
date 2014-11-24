class CreateProjectTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :role_id, index: true, null: false
    end
  end
end
