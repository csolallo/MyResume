class Role < ApplicationRecord
  belongs_to :company
  belongs_to :resume, :optional => true
  has_many :projects
  has_many :accomplishments, as: :associated

  scope :in_resume, -> (resume){ where(resume: resume) }
  scope :at_company, -> (company){ where(company: company).order(start_date: :desc) }
  # roles that started on/after the date, or started earlier but were still active on it (end_date is null for a current role)
  scope :since, -> (start){ where('"roles"."start_date" >= :start OR "roles"."end_date" IS NULL OR "roles"."end_date" >= :start', start: start).order(start_date: :desc) }
end
