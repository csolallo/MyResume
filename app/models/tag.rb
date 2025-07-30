class Tag < ApplicationRecord
  has_and_belongs_to_many :projects

  scope :in_resume, -> (resume) { distinct.joins(projects: :job).where('"roles"."resume_id" = ?', resume) }
end
