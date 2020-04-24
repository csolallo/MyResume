class Types::PersonType < Types::BaseObject
  description "A person. Owner of a resume."

  field :id, ID, null: false
  field :name, String, null: false
  field :phone, String, null: true
  field :email, String, null: true
  field :address, Types::AddressType, null: true
  field :certificates_or_degrees, [Types::CertificateType], null: true
  field :highlights, [String], null: true
  
  def phone
    object.number 
  end

  def address
    {
      address1: object.address1,
      address2: object.address2,
      city: object.city,
      state: object.state,
      zip: object.zip
    }
  end

  def certificates_or_degrees
    object.certificates
  end

  def highlights
    object.highlights.map { |cert| cert.description }
  end
end
