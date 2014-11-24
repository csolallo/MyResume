class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address1
      t.string :address2
      t.string :city, limit: 50
      t.string :state, limit: 2
      t.string :zip, limit: 10
    end
  end
end
