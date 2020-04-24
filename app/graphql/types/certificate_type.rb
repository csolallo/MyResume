class Types::CertificateType < Types::BaseObject
  description "A type to represent a certificate or a degree"

  field :origin, String, null: false
  field :title, String, null: false
  field :gpa, Float, null: true
  field :year, Int, null: false
end
