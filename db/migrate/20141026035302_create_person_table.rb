class CreatePersonTable < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false, :limit => 50
      t.string :uuid, null: false, unique: true
      t.string :address1
      t.string :address2
      t.string :city, :limit => 50
      t.string :state, :limit => 2
      t.string :zip, :limit => 10
      t.string :email, :limit => 80
      t.string :number, :limit => 20
    end
  end
end
