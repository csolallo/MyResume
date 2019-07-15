class Resume < ApplicationRecord
  belongs_to :person
  has_many :jobs, :class_name => 'Role'

  scope :for_person, -> (person) { where(:person => person) }
end
