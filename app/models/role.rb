class Role < ApplicationRecord
  belongs_to :company
  belongs_to :resume, :optional => true
  has_many :projects
  has_many :accomplishments, as: :associated

  scope :in_resume, -> (resume){ where(resume: resume) }
  scope :at_company, -> (company){ where(company: company).order(start_date: :desc) }
  scope :since, -> (start){ where('`roles`.`start_date` >= ?', start).order(start_date: :desc) }
end
