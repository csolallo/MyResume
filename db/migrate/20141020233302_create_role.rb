class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.integer :resume_id, index: true
      t.integer :company_id, null: false, index: true
    end
  end    
end
