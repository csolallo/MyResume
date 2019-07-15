class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :origin, :limit=> 100, null: false
      t.string :title, :limit=> 100, null: false
      t.float :gpa
      t.integer :year
      t.references :person
    end
  end
end
