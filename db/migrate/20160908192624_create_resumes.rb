class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.belongs_to :person, null: false
    end
  end
end
