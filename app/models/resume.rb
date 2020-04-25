class Resume < ApplicationRecord
  belongs_to :person
  has_many :jobs, -> { order 'start_date DESC' }, :class_name => 'Role'

  scope :for_person, -> (person) { where(:person => person) }
end
