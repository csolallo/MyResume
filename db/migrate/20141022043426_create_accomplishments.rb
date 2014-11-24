class CreateAccomplishments < ActiveRecord::Migration
  def change
    create_table :accomplishments do |t|
      t.text :description, null: false
      t.references :associated, polymorphic: true
    end
    
    add_index :accomplishments, [:associated_id, :associated_type]
  end
end
