class CreateResumeTable < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.belongs_to :person, null: false
    end
  end
end
