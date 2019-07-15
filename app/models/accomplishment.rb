class Accomplishment < ApplicationRecord
  belongs_to :associated, polymorphic: true
end
