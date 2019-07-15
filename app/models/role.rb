class Role < ApplicationRecord
  belongs_to :company
  belongs_to :resume, :optional => true
  has_many :projects
  has_many :accomplishments, as: :associated

  scope :in_resume, -> (resume){ where(resume: resume) }
  scope :since, -> (start){ where('`roles`.`start_date` >= ?', start).order(start_date: :desc) }
end
