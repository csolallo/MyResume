class CreateCertificateTable < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :origin, :limit=> 100, null: false
      t.string :title, :limit=> 100, null: false
      t.float :gpa
      t.integer :year
      t.references :person
    end
    
    add_index :certificates, :person_id
  end
end
