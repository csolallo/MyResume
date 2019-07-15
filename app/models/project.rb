class Project < ApplicationRecord
  belongs_to :job, :class_name => 'Role', :foreign_key => "role_id"
  has_many :accomplishments, as: :associated
  has_and_belongs_to_many :tags
  has_many :apps

  scope :in_resume, -> (resume){ distinct.joins(job: :resume).where("`resumes`.`id` = ?", resume) }
end
