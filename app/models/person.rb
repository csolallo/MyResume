class Person < ApplicationRecord
  has_one :resume
  has_many :certificates
  has_many :highlights, :class_name => 'Accomplishment', as: :associated
end
